import 'package:flutter/services.dart';
import 'package:instbug_task/core/exceptions/network_error.dart';
import 'package:instbug_task/core/network/cache_options.dart';
import 'package:instbug_task/core/network/interceptors/interceptor.dart';
import 'package:instbug_task/core/network/json_parser.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';

typedef BaseUrlBuilder = Future<String> Function();

class NetworkService {
  final JsonParser _jsonParser = JsonParser();
  final BaseUrlBuilder baseUrlBuilder;
  final List<Interceptor> _interceptors = [];
  final CacheOptions cacheOptions;
  final MethodChannel? _channelMethod;
  static const _defaultChannel = MethodChannel("com.http");

  NetworkService({MethodChannel? methodChannel, required this.baseUrlBuilder, required this.cacheOptions})
      : _channelMethod = methodChannel ?? _defaultChannel;

  void addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
  }

  Future<NetworkResponse<T>> request<T extends Object, K>({
    required NetworkRequest request,
    K Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _request(request);

      final dataObject = _jsonParser.parse<T, K>(response.data, fromJson);

      if (dataObject != null) {
        return NetworkResponse.success(
          statusCode: response.statusCode,
          data: dataObject,
        );
      } else {
        return NetworkResponse.failure(
          statusCode: response.statusCode,
          errorType: NetworkErrorType.parsing,
        );
      }
    } on NetworkError catch (networkError) {
      return NetworkResponse.failure(
        statusCode: networkError.response?.statusCode,
        errorType: networkError.type,
      );
    } on Error catch (_) {
      return NetworkResponse.failure(
        statusCode: null,
        errorType: NetworkErrorType.other,
      );
    }
  }

  Future<NetworkNativeResponse> _request(NetworkRequest request) async {
    request.baseUrl = await baseUrlBuilder();
    for (final interceptor in _interceptors) {
      interceptor.onRequest(request);
    }
    Map<String, dynamic>? response;

    response = cacheOptions.get(request);

    response ??= await _channelMethod?.invokeMapMethod<String, dynamic>(
      request.method,
      request.toMap(),
    );

    // get value from cache if response == null
    if (response == null) throw Error();

    final result = NetworkNativeResponse.fromMap(response);

    switch (result.statusCode) {
      case 200:
        for (final interceptor in _interceptors) {
          interceptor.onResponse(request, result);
        }
        break;
      case 401:
        throw NetworkError(
          type: NetworkErrorType.notAuthorized,
        );
      case 500:
        throw NetworkError(type: NetworkErrorType.internalServerError);
    }
    return result;
  }
}

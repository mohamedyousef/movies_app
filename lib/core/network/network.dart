import 'package:flutter/services.dart';
import 'package:instbug_task/core/exceptions/network_error.dart';
import 'package:instbug_task/core/network/interceptor.dart';
import 'package:instbug_task/core/network/json_parser.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';

typedef BaseUrlBuilder = Future<String> Function();

class NetworkService {
  static const channelMethod = MethodChannel("com.http");
  final JsonParser _jsonParser = JsonParser();
  final BaseUrlBuilder baseUrlBuilder;
  final List<Interceptor> _interceptors = [];

  NetworkService({required this.baseUrlBuilder});

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
    final Map<String, dynamic>? response = await channelMethod.invokeMapMethod<String, dynamic>(
      request.method,
      request.toMap(),
    );
    if (response == null) throw Error();
    final result = NetworkNativeResponse.fromMap(response);

    switch (result.statusCode) {
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

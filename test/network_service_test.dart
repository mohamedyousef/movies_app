import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instbug_task/core/cache/app_local_database.dart';
import 'package:instbug_task/core/config/config.dart';
import 'package:instbug_task/core/network/cache_options.dart';
import 'package:instbug_task/core/network/interceptors/cache_interceptor.dart';
import 'package:instbug_task/core/network/interceptors/interceptor.dart';
import 'package:instbug_task/core/network/network.dart';
import 'package:instbug_task/features/movies/data/entities/entites.dart';
import 'package:mockito/mockito.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';

// Create a mock class for the MethodChannel
class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  group('NetworkService', () {
    late NetworkService networkService;
    late MockMethodChannel mockChannel;

    setUp(() {
      mockChannel = MockMethodChannel();
      networkService = NetworkService(
        baseUrlBuilder: () async => baseUrlStaging,
        cacheOptions: CacheOptions(store: AppLocalDatabase.instance),
      )
        ..addInterceptor(QueryAccessKeyInterceptor())
        ..addInterceptor(CacheInterceptor(AppLocalDatabase.instance));
    });

    test('request - success', () async {
      // Mock a successful network response
      final request = NetworkRequest.get(endPoint: "");

      when(mockChannel.invokeMapMethod(request.method, any)).thenAnswer((_) async {
        return {
          'statusCode': 200,
          'data': {'results': []},
        };
      });

      final response = await networkService.request<String, dynamic>(
        request: request,
        fromJson: MovieListEntity.fromJson,
      );

      expect(response.data, {
        'statusCode': 200,
        'data': {'results': []},
      });
    });

    test('request - failure', () async {
      // Mock a network error response
      when(mockChannel.invokeMapMethod<String, dynamic>(
        "GET",
        any,
      )).thenThrow(Error());

      final response = await networkService.request<String, dynamic>(
          request: NetworkRequest.get(
            endPoint: "",
          ),
          fromJson: MovieListEntity.fromJson);

      expect(response.errorType, NetworkErrorType.other);
    });

    test('request - unauthorized', () async {
      // Mock an unauthorized response
      when(mockChannel.invokeMapMethod<String, dynamic>(
        "GET",
        any,
      )).thenAnswer((_) async {
        return {
          'statusCode': 401,
        };
      });

      final response = await networkService.request<String, dynamic>(
          request: NetworkRequest.get(endPoint: ''), fromJson: MovieListEntity.fromJson);

      expect(response.errorType, NetworkErrorType.notAuthorized);
    });
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instbug_task/core/cache/hive_cache_store.dart';
import 'package:instbug_task/core/config/config.dart';
import 'package:instbug_task/core/exceptions/network_error.dart';
import 'package:instbug_task/core/network/cache_options.dart';
import 'package:instbug_task/core/network/interceptors/cache_interceptor.dart';
import 'package:instbug_task/core/network/interceptors/interceptor.dart';
import 'package:instbug_task/core/network/network.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';
import 'package:instbug_task/features/movies/data/entities/entites.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_service_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<HiveCacheStore>(
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<MethodChannel>(
    onMissingStub: OnMissingStub.returnDefault,
  )
])
void main() {
  group('NetworkService', () {
    late NetworkService networkService;
    late MockMethodChannel mockChannel;
    late MockHiveCacheStore cacheStore;

    setUp(() async {
      await TestWidgetsFlutterBinding.ensureInitialized();

      mockChannel = MockMethodChannel();
      cacheStore = MockHiveCacheStore();
      networkService = NetworkService(
        methodChannel: mockChannel,
        baseUrlBuilder: () async => baseUrlStaging,
        cacheOptions: CacheOptions(store: cacheStore),
      )
        ..addInterceptor(QueryAccessKeyInterceptor())
        ..addInterceptor(CacheInterceptor(cacheStore));
    });

    test('request - success', () async {
      // Mock a successful network response
      final request = NetworkRequest.get(endPoint: "discover/movie/");
      when(cacheStore.exists(request.baseUrl)).thenReturn(true);

      when(await mockChannel.invokeMapMethod(request.method, request.toMap())).thenReturn({
        'statusCode': 200,
        'data': "{'results': []}",
      });

      final NetworkResponse<MovieListEntity> response = await networkService.request(
        request: request,
        fromJson: MovieListEntity.fromJson,
      );

      print(response.when(success: (data) => data.data, failure: (failure) => failure));
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
            endPoint: "discover/movie/",
          ),
          fromJson: MovieListEntity.fromJson);

      expect(response.errorType, NetworkErrorType.other);
    });

    test('request - unauthorized', () async {
      // Mock an unauthorized response
      when(mockChannel.invokeMapMethod<String, dynamic>(
        "GET",
        any,
      )).thenThrow((NetworkError(type: NetworkErrorType.notAuthorized)));

      final response = await networkService.request<String, dynamic>(
          request: NetworkRequest.get(endPoint: 'discover/movie/'), fromJson: MovieListEntity.fromJson);

      expect(response.errorType, NetworkErrorType.notAuthorized);
    });
  });
}

import 'package:instbug_task/core/cache/app_local_database.dart';
import 'package:instbug_task/core/network/interceptors/interceptor.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';

class CacheInterceptor extends Interceptor {
  final AppLocalDatabase _appLocalDatabase;
  CacheInterceptor(this._appLocalDatabase);

  @override
  void onResponse(NetworkRequest request, NetworkNativeResponse networkResponse) async {
    if (networkResponse.data != null) {
      _appLocalDatabase.put<String>(AppLocalDatabase.NETWORK_REQUESTS, request.baseUrl, networkResponse.data!);
    }
  }

// todo
  // void clearExpiredCacheEntries(DateTime expirationDate) {
  //   final cacheBox = Hive.box(AppLocalDatabase.NETWORK_REQUESTS);
  //   final keysToRemove = <String>[];

  //   for (var key in cacheBox.keys) {
  //     final cachedData = jsonDecode(cacheBox.get(key));
  //     final timestamp = DateTime.fromMillisecondsSinceEpoch(cachedData['timestamp']);
  //     if (timestamp.isBefore(expirationDate)) {
  //       // Add key to removal list
  //       keysToRemove.add(key);
  //     }
  //   }

  //   // Remove expired cache entries
  //   for (var key in keysToRemove) {
  //     cacheBox.delete(key);
  //   }
  // }
}

import 'package:instbug_task/core/cache/app_local_database.dart';
import 'package:instbug_task/core/network/network_request.dart';

class CacheOptions {
  final AppLocalDatabase store;
  CacheOptions({
    required this.store,
  });

  Map<String, dynamic>? get(NetworkRequest networkRequest) {
    if (!_exists(networkRequest)) return null;
    final data = store.get(AppLocalDatabase.NETWORK_REQUESTS, networkRequest.baseUrl);
    return {"data": data, "statusCode": 200};
  }

  bool _exists(NetworkRequest networkRequest) {
    return store.exists(AppLocalDatabase.NETWORK_REQUESTS, networkRequest.baseUrl);
  }
}

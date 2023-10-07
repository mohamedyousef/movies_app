import 'package:instbug_task/core/cache/cache_store.dart';
import 'package:instbug_task/core/network/network_request.dart';

class CacheOptions {
  final CacheStore store;
  CacheOptions({
    required this.store,
  });

  Map<String, dynamic>? get(NetworkRequest networkRequest) {
    if (!_exists(networkRequest)) return null;
    final data = store.get(networkRequest.baseUrl);
    return {"data": data, "statusCode": 200};
  }

  bool _exists(NetworkRequest networkRequest) {
    return store.exists(networkRequest.baseUrl);
  }
}

import 'package:hive_flutter/hive_flutter.dart';

import 'cache_store.dart';

class HiveCacheStore implements CacheStore {
  static String boxName = "network";

  @override
  Future<void> put<T>(String key, T value) {
    return Hive.box<T>(boxName).put(key, value);
  }

  @override
  Future<void> delete<T>(String key) {
    return Hive.box<T>(boxName).delete(key);
  }

  @override
  String get(String key) {
    return Hive.box<String>(boxName).get(key, defaultValue: '') ?? '';
  }

  @override
  bool exists(String key) => Hive.box<String>(boxName).containsKey(key);
}

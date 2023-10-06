import 'package:hive_flutter/hive_flutter.dart';

class AppLocalDatabase {
  static const AppLocalDatabase _instance = AppLocalDatabase._();

  static AppLocalDatabase get instance => _instance;
  const AppLocalDatabase._();

  static String NETWORK_REQUESTS = "network";

  Future<void> put<T>(String boxName, String key, T value) {
    return Hive.box<T>(boxName).put(key, value);
  }

  Future<void> delete<T>(String box, String key) {
    return Hive.box<T>(box).delete(key);
  }

  String get(String box, String key) {
    return Hive.box<String>(box).get(key, defaultValue: '') ?? '';
  }

  bool exists(String box, String key) => Hive.box<String>(box).containsKey(key);
}

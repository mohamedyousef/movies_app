abstract class CacheStore {
  Future<void> put<T>(String key, T value);
  Future<void> delete<T>(String key);
  String get(String key);
  bool exists(String key);
}

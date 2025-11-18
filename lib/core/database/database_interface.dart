abstract class DatabaseInterface<T> {
  Future<void> save(String key, T value);
  Future<T?> get(String key);
  Future<void> delete(String key);
  Future<void> deleteAll();
  Future<List<T>> getAll();
  Future<int> count();
  Future<void> close();
}


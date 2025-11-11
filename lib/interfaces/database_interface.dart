abstract class DatabaseInterface<K, V> {
  Future<void> saveItem(V value, K key);
  Future<V?> getItem(K key);
  Future<void> deleteItem(K key);
  Future<void> clearAll();
}
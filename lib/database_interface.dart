abstract class DatabaseInterface<TItem,TKey> {
  Future<void> open();
  Future<void> close();
  Future<TItem?> getItem(TKey key);
  Future<List<TItem>> getAllItems();
  Future<void> saveItem(TItem item, TKey key);
  Future<void> deleteItem(TKey key);
  Future<void> clearDatabase();
}
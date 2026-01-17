import 'package:hive_ce_flutter/adapters.dart';
import 'package:vitalingu/interfaces/i_identifiable.dart';

class BaseHiveRepository<T extends IIdentifiable> {
  final Box<T> box;

  BaseHiveRepository({required this.box});

  Future<void> addItem(T item) async {
    await box.put(item.id, item);
  }

  Future<void> updateItem(T item) async {
    await box.put(item.id, item);
  }

  T? getItemById(String id) {
    return box.get(id);
  }

  List<T> getAllItems() {
    return box.values.toList();
  }

  Future<void> deleteItem(T item) async {
    await box.delete(item.id);
  }

  Future<void> deleteItemById(String id) async {
    await box.delete(id);
  }
  
  Future<void> clearAllItems() async {
    await box.clear();
  }

  Future<int> getItemCount() async {
    return box.length;
  }

}
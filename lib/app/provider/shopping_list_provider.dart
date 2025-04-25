import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ShoppingListProvider with ChangeNotifier {
  List<String> _lists = [];

  List<String> get lists => _lists;

  final Box _box = Hive.box('shopping_lists');

  ShoppingListProvider() {
    _loadLists();
  }

  void _loadLists() {
    _lists = _box.values.cast<String>().toList();
    notifyListeners();
  }

  void addList(String name) {
    _box.add(name);
    _loadLists();
  }

  void deleteList(int index) {
    _box.deleteAt(index);
    _loadLists();
  }
}

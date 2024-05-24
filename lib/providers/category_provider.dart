import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String? _selectedCategory;

  String? get selectedCategory => _selectedCategory;

  set selectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }
}

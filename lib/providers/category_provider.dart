import 'package:flutter/material.dart';
import 'package:store/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  // stocker un produit
  Category? _category;

  // getter / setter
  Category? get category => _category;

  set product(Category? value) {
    _category = value;
    // notifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}

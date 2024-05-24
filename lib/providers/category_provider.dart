import 'package:flutter/material.dart';
import 'package:store/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  // Stocker le nom de la catégorie sélectionnée
  String? _selectedCategory;

  // Getter / Setter pour la catégorie sélectionnée
  String? get selectedCategory => _selectedCategory;

  set selectedCategory(String? category) {
    _selectedCategory = category;
    // Notifier les écouteurs du provider que la catégorie sélectionnée a été mise à jour
    notifyListeners();
  }
}

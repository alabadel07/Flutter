import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:store/config/config.dart';
import 'package:store/models/category.dart';

class CategoriesService {
  final Map<String, IconData> _categoryIcons = {
    'electronics': Icons.electrical_services,
    'jewelery': Icons.watch,
    'men\'s clothing': Icons.male,
    'women\'s clothing': Icons.female,
  };

  Future<List<Category>> getCategories() async {
    Uri uri = Uri.parse('${Config.API_URL}/products/categories');
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Category> categories = data.map((value) {
        String categoryName = value.toString();
        IconData icon =
            _categoryIcons[categoryName.toLowerCase()] ?? Icons.category;
        return Category(name: categoryName, icon: icon);
      }).toList();
      return categories;
    } else {
      throw Error();
    }
  }
}

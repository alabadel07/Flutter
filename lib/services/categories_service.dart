import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/category.dart';

class CategoriesService {
  Future<List<Category>> getCategories() async {
    Uri uri = Uri.parse('${Config.API_URL}/products/categories');
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Category> categories = data.map((value) {
        return Category(name: value.toString());
      }).toList();
      return categories;
    } else {
      throw Error();
    }
  }
}

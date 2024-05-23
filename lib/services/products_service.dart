import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';

class ProductsService {
  /*
    récupérer tous les produits
    Future équivalent d'une Promise en JS
  */
  Future getProducts() async {
    // réquête en GET
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response response = await http.get(uri);

    // récupérer la réponse
    if (response.statusCode == 200) {
      // convertir les données en JSON
      List data = jsonDecode(response.body);
      inspect(data);
    }
    // renvoyer une erreur
    else {
      throw Error();
    }
  }
}

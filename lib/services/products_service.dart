import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/product.dart';

class ProductsService {
  Future<List<Product>> getProducts() async {
    // Effectuer une requête GET pour récupérer tous les produits
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response response = await http.get(uri);

    // Vérifier le statut de la réponse
    if (response.statusCode == 200) {
      // Convertir les données JSON en une liste de produits
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((value) {
        return Product(
          id: value['id'],
          title: value['title'],
          price: value['price'],
          description: value['description'],
          category: value['category'],
          image: value['image'],
          rating: value['rating'],
        );
      }).toList();
      return products;
    } else {
      // En cas d'erreur, lancer une exception
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    // Récupérer tous les produits
    List<Product> allProducts = await getProducts();

    // Filtrer les produits par catégorie
    List<Product> categoryProducts =
        allProducts.where((product) => product.category == category).toList();

    return categoryProducts;
  }
}

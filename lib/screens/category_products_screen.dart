import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store/providers/category_provider.dart';
import 'package:store/widgets/common/appbar_widget.dart';

class CategoryProductsScreen extends StatelessWidget {
  CategoryProductsScreen({super.key});

  Future<List<dynamic>> fetchProducts(String category) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryName =
        Provider.of<CategoryProvider>(context).selectedCategory;

    return Scaffold(
      appBar: AppbarWidget(),
      body: categoryName == null
          ? Center(child: Text('Veuillez sélectionner une catégorie.'))
          : FutureBuilder<List<dynamic>>(
              future: fetchProducts(categoryName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur : ${snapshot.error}'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                products[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                products[index]['title'],
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('\$${products[index]['price']}'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}

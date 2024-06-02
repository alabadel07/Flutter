import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_provider.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedCategory =
        context.watch<CategoryProvider>().selectedCategory;

    if (selectedCategory == null) {
      return Center(
        child: Text('Aucune catégorie sélectionnée.'),
      );
    }

    return Column(
      children: [
        Container(
          height: 300,
          alignment: Alignment.center,
          child: Text(
            selectedCategory,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

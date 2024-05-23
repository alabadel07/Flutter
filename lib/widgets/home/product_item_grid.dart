import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductItemGrid extends StatelessWidget {
  // récupérer le produit envoyé par la grille
  Product product;

  ProductItemGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          product.image,
          height: 130,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 35,
          child: Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('${product.price}€'),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            side: BorderSide.none,
            shape: const BeveledRectangleBorder(),
          ),
          child: const Text('View'),
        ),
      ],
    );
  }
}

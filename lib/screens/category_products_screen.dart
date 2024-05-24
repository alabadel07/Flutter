import 'package:flutter/material.dart';
import 'package:store/widgets/category_details/category_details_widget.dart';
import 'package:store/widgets/common/appbar_widget.dart';

class CategoryProductsScreen extends StatelessWidget {
  CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryDetailsWidget(),
          ],
        ),
      ),
    );
  }
}

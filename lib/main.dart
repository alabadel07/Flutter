import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/category_products_screen.dart';
import 'package:store/services/router_service.dart';
import 'package:store/widgets/common/drawer_widget.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryProvider(),
          ),
        ],
        child: const Store(),
      ),
    );

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Store",
      routerConfig: RouterService.getRouter(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryProductsScreen(),
              ),
            );
          },
          child: Text('Voir les produits de la catégorie'),
        ),
      ),
    );
  }
}

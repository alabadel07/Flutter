import 'package:go_router/go_router.dart';
import 'package:store/screens/category_products_screen.dart';
import 'package:store/main.dart';

class RouterService {
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/category-products',
          builder: (context, state) => CategoryProductsScreen(),
        ),
      ],
    );
  }
}

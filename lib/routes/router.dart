import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/shopping_cart.dart';
import '../screens/user_screen.dart';
import '../screens/product_screen.dart';
import '../screens/checkout_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => HomeScreen())),
  GoRoute(path: '/cart', builder: ((context, state) => ShoppingCart())),
  GoRoute(path: '/user', builder: ((context, state) => UserScreen())),
  GoRoute(path: '/checkout', builder: ((context, state) => CheckoutScreen())),
  GoRoute(
      path: '/product/:id',
      builder: ((context, state) =>
          ProductScreen(int.parse(state.params['id']!))))
]);

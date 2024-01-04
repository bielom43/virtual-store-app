//files
import 'package:clothing_store/providers/cart.dart';
import 'package:clothing_store/models/order_list.dart';
import 'package:clothing_store/providers/product_list.dart';
import 'package:clothing_store/screens/cart_screen.dart';
import 'package:clothing_store/screens/orders_screen.dart';
import 'package:clothing_store/screens/product_details_screen.dart';
import 'package:clothing_store/screens/product_form_screen.dart';
import 'package:clothing_store/screens/products_screen.dart';
import 'package:clothing_store/screens/products_overview_screen.dart';
import 'package:clothing_store/utils/routes/app_routes.dart';
//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bem-Vindo!',
        // home: const ProductsOverViewScreen(),
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.orange[900],
            secondary: Colors.deepPurpleAccent.shade200,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.home: (context) => const ProductsOverViewScreen(),
          AppRoutes.PRODUCT_DETAILS_SCREEN: (context) => const ProductDetailsScreen(),
          AppRoutes.CART: (context) => const CartScreen(),
          AppRoutes.ORDERS: (context) => const OrdersScreen(),
          AppRoutes.PRODUCTS: (context) => const ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (context) => const ProductFormScreen(),
        },
      ),
    );
  }
}

// ignore_for_file: depend_on_referenced_packages

//files
import 'package:clothing_store/providers/cart.dart';
import 'package:clothing_store/providers/order_list.dart';
import 'package:clothing_store/providers/product_list.dart';
import 'package:clothing_store/screens/cart_screen.dart';
import 'package:clothing_store/screens/product_details_screen.dart';
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
        home: const ProductsOverViewScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.orange[900],
            secondary: Colors.deepPurpleAccent.shade200,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.PRODUCT_DETAILS_SCREEN: (context) => const ProductDetailsScreen(),
          AppRoutes.CART: (context) => const CartScreen(),
        },
      ),
    );
  }
}

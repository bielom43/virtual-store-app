//files
import 'package:clothing_store/screens/product_details_screen.dart';
import 'package:clothing_store/screens/products_overview_screen.dart';
import 'package:clothing_store/utils/routes/app_routes.dart';
//packages
import 'package:flutter/material.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem-Vindo!',
      home: ProductsOverViewScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.orange[900],
          secondary: Colors.deepPurpleAccent.shade200,
        ),
        fontFamily: 'Lato',
      ),
      routes: {
        AppRoutes.PRODUCT_DETAILS_SCREEN: (context) => const ProductDetailsScreen(),
      },
    );
  }
}

//files
import 'package:clothing_store/models/product.dart';
import 'package:clothing_store/components/product_item.dart';
import '../data/dummy_data.dart';
//packages
import 'package:flutter/material.dart';

class ProductsOverViewScreen extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;

  ProductsOverViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductItem(product: loadedProducts[index]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

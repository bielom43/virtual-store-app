//files
import 'package:clothing_store/components/main_drawer.dart';
import 'package:clothing_store/components/product_item.dart';
import 'package:clothing_store/providers/product_list.dart';
import 'package:clothing_store/utils/routes/app_routes.dart';
//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gerenciamento de Produtos',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, index) => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProductItem(product: products.items[index]),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

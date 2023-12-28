//files
import 'package:clothing_store/models/product.dart';
import 'package:clothing_store/providers/cart.dart';
import 'package:clothing_store/utils/routes/app_routes.dart';
//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              splashColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            splashColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Produto adicionado!'),
                  duration: const Duration(seconds: 2, milliseconds: 5),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      cart.removeLastSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.black54,
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAILS_SCREEN,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}

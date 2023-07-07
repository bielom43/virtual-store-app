import 'package:clothing_store/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageURL),
      ),
      title: Text('Produto ${product.name}'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}

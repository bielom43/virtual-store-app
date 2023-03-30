import 'package:clothing_store/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem Vindo!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.home,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.ORDERS,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

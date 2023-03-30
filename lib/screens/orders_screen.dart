//files
import 'package:clothing_store/components/main_drawer.dart';
import 'package:clothing_store/components/order_item.dart';
import 'package:clothing_store/providers/order_list.dart';
//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) => OrderWidget(
          order: orders.items[index],
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}

//files
import 'dart:convert';
import 'dart:math';

import 'package:clothing_store/data/dummy_data.dart';
import 'package:clothing_store/models/product.dart';

//packages
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsList with ChangeNotifier {
  final baseUrl = 'https://shop-app-fl-default-rtdb.firebaseio.com';
  final List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((product) => product.isFavorite).toList();
    }
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageURL: data['imageUrl'] as String,
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
  }

  void addProduct(Product product) {
    final future = http.post(
      Uri.parse('$baseUrl/products.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "price": product.price,
          "description": product.description,
          "imageURL": product.imageURL,
          "isFavorite": product.isFavorite,
        },
      ),
    );
    future.then(
      (response) {
        final id = jsonDecode(response.body)['name'];
        _items.add(
          Product(
            id: id,
            name: product.name,
            description: product.description,
            price: product.price,
            imageURL: product.imageURL,
            isFavorite: product.isFavorite,
          ),
        );
        notifyListeners();
      },
    );
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
}

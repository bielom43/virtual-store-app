import 'dart:convert';

import 'package:clothing_store/exceptions/http_exceptions.dart';
import 'package:clothing_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageURL;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    try {
      _toggleFavorite();

      final response = await http.patch(
        Uri.parse('${Constants.PRODUCT_BASE_URL}/$id.json'),
        body: jsonEncode({"isFavorite": isFavorite}),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (error) {
      _toggleFavorite();
    }
  }
}

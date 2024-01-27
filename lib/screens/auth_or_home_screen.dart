import 'package:clothing_store/models/auth.dart';
import 'package:clothing_store/screens/auth_screen.dart';
import 'package:clothing_store/screens/products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return auth.isAuth ? ProductsOverViewScreen() : AuthScreen();
  }
}

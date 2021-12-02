import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  // List<ProductsCatalog> cartProducts = [];
  // List<ProductsCatalog> favoritProducts = [];

  List<String> cartSlugs = [];
  List<String> favoritSlugs = [];

  void updateProvider() {
    notifyListeners();
  }
}
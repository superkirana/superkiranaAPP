import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ProductService {
  List<dynamic> productList = [];

  // Load the product JSON from assets.
  Future<void> loadProducts() async {
    final data = await rootBundle.loadString('assets/products.json');
    productList = json.decode(data);
  }

  // Search for a product by name.
  Map<String, dynamic>? searchProduct(String query) {
    try {
      return productList.firstWhere(
        (product) => product['productName'].toString().toLowerCase() == query.toLowerCase(),
        orElse: () => null,
      );
    } catch (e) {
      return null;
    }
  }
}

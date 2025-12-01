import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'product_model.dart';

class ProductRepository {
  Future<List<Product>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/products.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

import 'package:flutter/material.dart';
import 'product_page.dart';
import 'product_repository.dart'
import 'product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<List<Product>>(
        future: ProductRepository().loadProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Example: show first product from products.json
          final product = snapshot.data!.first;
          return ProductPage(product: product);
        },
      ),
    );
  }
}
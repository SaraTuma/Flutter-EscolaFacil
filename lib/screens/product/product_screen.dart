import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}

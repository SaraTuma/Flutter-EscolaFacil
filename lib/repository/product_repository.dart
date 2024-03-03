import 'package:flutter/widgets.dart';

import '../models/product_model.dart';

class ProductRepository {
  ProductRepository() {
    initProduts();
  }

  late ProductModel productModel;
  late List<ProductModel> listProducts;

  ProductModel? findProductById(int? id) {
    for (var element in listProducts) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
  }

  Future<void> initProduts() async {
    listProducts = [
      ProductModel(
          image: "assets/images/logo.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
      ProductModel(
          image: "assets/images/logo.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
      ProductModel(
          image: "assets/images/logo.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
    ];
    debugPrint(listProducts.toString());
  }

  Future<List<ProductModel>> getFilteredProducts(String search) {
    List<ProductModel> filteredProducts = [];
    if (search.isEmpty) {
      return Future.delayed(
          const Duration(seconds: 4),
          () => listProducts,
        );
    } else {
      filteredProducts
          .addAll(listProducts.where((p) => p.name.toLowerCase().contains(search)));
          return Future.delayed(
          const Duration(seconds: 4),
          () => filteredProducts,
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_escola_facil/models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8.0),
        child: Row(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              product.image,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'A partir de',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ),
              Text(
                "AOA ${product.price}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(25, 95, 224, 1)),
              )
            ],
          ))
        ]),
      ),
    );
  }
}

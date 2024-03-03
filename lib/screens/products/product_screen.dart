import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/common/custom_drawer/custom_drawer.dart';
import 'package:flutter_escola_facil/models/product_model.dart';

import 'componets/product_list_tile.dart';
import 'componets/search_dialog.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //List<ProductModel> lista = context.read<ProductRepository>().listProducts;
    String? search = '';
    List<ProductModel> produtos = [
      ProductModel(
          image: "assets/images/Papelaria-1.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
      ProductModel(
          image: "assets/images/Papelaria-1.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
      ProductModel(
          image: "assets/images/Papelaria-1.png",
          description:
              'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
          name: 'Papel',
          price: 12000.00,
          quantity: 12),
    ];

    return Scaffold(
      appBar: AppBar(
        title: search == ''
            ? Text(
                'Produtos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(25, 95, 224, 1)),
              )
            : LayoutBuilder(builder: (context, constraints) {
                return GestureDetector(
                  onTap: () async {
                    search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(
                              iniatialText: search as String,
                            ));
                    if (search != '') {
                      debugPrint('Digitado : $search');
                      //enviar o valor pesquisado no repository
                      //assim rebuildar a tela com os produtos que tem nome semelhante a este digitado
                    }
                  },
                  child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        search!,
                        textAlign: TextAlign.center,
                      )),
                );
              }),
        actions: [
          search == ''
              ? IconButton(
                  onPressed: () async {
                    search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(
                              iniatialText: search as String,
                            ));
                    if (search != '') {
                      debugPrint('Digitado : $search');
                      //enviar o valor pesquisado no repository
                      //assim rebuildar a tela com os produtos que tem nome semelhante a este digitado
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(25, 95, 224, 1),
                  ))
              : IconButton(
                  onPressed: () {
                    search = '';
                  },
                  icon: Icon(Icons.close),
                  color: Color.fromRGBO(25, 95, 224, 1),
                )
        ],
        centerTitle: true,
      ),
      drawer: const CustomDrawer(page: 1),
      body: ListView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return ProductListTile(
              product: produtos[index],
            );
          }),
    );
  }
}

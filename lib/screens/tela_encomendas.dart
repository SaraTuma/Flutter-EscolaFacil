import 'package:flutter/material.dart';
import '../common/custom_drawer/custom_drawer.dart';
import '../models/produto.dart';

class TelaEncomendas extends StatefulWidget {
  const TelaEncomendas({super.key});

  @override
  State<TelaEncomendas> createState() => _TelaEncomendasState();
}

class _TelaEncomendasState extends State<TelaEncomendas> {
  List<ProdutoModel> produtos = [
    ProdutoModel(
        imagem: "assets/images/logo.png",
        descricao:
            'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
        nome: 'Papel',
        preco: 12000.00,
        quantidade: 12),
    ProdutoModel(
        imagem: "assets/images/logo.png",
        descricao:
            'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
        nome: 'Papel',
        preco: 12000.00,
        quantidade: 12),
    ProdutoModel(
        imagem: "assets/images/logo.png",
        descricao:
            'Lorem ipson lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
        nome: 'Papel',
        preco: 12000.00,
        quantidade: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Encomendas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(25, 200, 224, 1),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.find_replace,
                  color: Color.fromRGBO(25, 200, 224, 1),
                ))
          ],
        ),
        drawer: const CustomDrawer(page: 3,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: Text(
                    '10 encomendas no total',
                    style: TextStyle(
                        color: Color.fromRGBO(25, 95, 224, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          title: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Conjunto de Lápis",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Preço total ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ), //
                              Text(
                                "10.000 KZ / AOA",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              'Visualizar',
                              style: TextStyle(
                                  color: Color.fromRGBO(25, 95, 224, 1)),
                            ),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

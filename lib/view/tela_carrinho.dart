import 'package:flutter/material.dart';

import '../models/produto.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
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
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.find_replace,
                  color: Color.fromRGBO(25, 200, 224, 1),
                ))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8.0, top: 20, left: 10.0),
                child: Row(children: [
                  Container(
                    child: const Text("Escola",
                        style: TextStyle(
                            color: Color.fromRGBO(25, 95, 224, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  const Text("Fácil",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ]),
              ),
              Divider(
                height: 20.0,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  "Tela Principal",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Adicionar produto",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  "Carrinho",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  "Perfil",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  "Idioma",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  "Sair",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(25, 95, 224, 1),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Clicou em Encomendar');
          },
          tooltip: 'Fazer encomenda',
          backgroundColor: const Color.fromRGBO(25, 200, 224, 1),
          child: const Icon(Icons.car_crash, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Produtos do carrinho',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(25, 200, 224, 1),
                  ),
                )),
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: Text(
                    '10 Produtos encontrados.',
                    style: TextStyle(
                        color: Color.fromRGBO(25, 95, 224, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
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
                          leading: Image.asset(
                            "assets/images/Papelaria-1.png",
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            "Conjunto de Lápis",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Qtd : 2',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(25, 95, 224, 1),
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
                              'Editar',
                              style: TextStyle(
                                  color: Color.fromRGBO(25, 95, 224, 1)),
                            ),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text(
                              'Eliminar',
                              style: TextStyle(color: Colors.red),
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

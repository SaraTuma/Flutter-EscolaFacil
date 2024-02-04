import 'package:flutter/material.dart';
import '../common/custom_drawer/custom_drawer.dart';
import '../models/produto.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
                  Icons.person,
                  color: Color.fromRGBO(25, 200, 224, 1),
                ))
          ],
        ),
        drawer: const CustomDrawer(page: 1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Clicou em Adicionar produto');
          },
          tooltip: 'Adicionar produto',
          backgroundColor: const Color.fromRGBO(25, 200, 224, 1),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                //color: Colors.green,
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Categorias',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Papelaria",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.black12)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Papelaria",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(25, 200, 224, 1))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Papelaria",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(25, 200, 224, 1))),
                )
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: Text(
                    '10 Produtos encontrados.',
                    style: TextStyle(
                        color: Colors.green,
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
                  margin: EdgeInsets.all(10),
                  // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  // Set the clip behavior of the card
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // Define the child widgets of the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                      Image.asset(
                        "assets/images/Papelaria-1.png",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Add a container with padding that contains the card's title, text, and buttons
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Display the card's title using a font size of 24 and a dark grey color
                            Text(
                              "Conjunto de Lápis",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold),
                            ),
                            // Add a space between the title and the text
                            Container(height: 10),
                            // Display the card's text using a font size of 15 and a light grey color
                            Text(
                              "10.000 KZ / AOA",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Add a row with two buttons spaced apart and aligned to the right side of the card
                            Row(
                              children: <Widget>[
                                // Add a spacer to push the buttons to the right side of the card
                                const Spacer(),
                                // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "VER",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/produto');
                                  },
                                ),
                                // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "ENCOMENDAR",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add a small space between the card and the next widget
                      Container(height: 5),
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

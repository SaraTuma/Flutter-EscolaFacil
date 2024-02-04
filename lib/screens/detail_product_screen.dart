import 'package:flutter/material.dart';

class TelaDetalhesProduto extends StatefulWidget {
  const TelaDetalhesProduto({super.key});

  @override
  State<TelaDetalhesProduto> createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  late int valor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valor = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            print('Go back Clicked');
            //Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              ))
        ],
      ),
      body: Container(
        height: 700,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Image.asset(
                "assets/images/Papelaria-1.png",
                height: 270,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5),
                height: 40,
                width: 150,
                color: Color.fromRGBO(40, 168, 247, 1),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (valor < 10) {
                              setState(() {
                                valor++;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      Text(
                        valor.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            if (valor > 1) {
                              setState(() {
                                valor--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                    ]),
              ),
            ),
            Container(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('Preço',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
              Text('10.000 Kz / AOA',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold))
            ]),

            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Conjunto de Lápis",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Add a space between the title and the text
            Container(height: 10),
            // Display the card's text using a font size of 15 and a light grey color
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 350,
              child: Text(
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 13),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    print('clicou...');
                  },
                  child: Text("Adicionar no carrinho",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(25, 200, 224, 1))),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 13),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    print('clicou...');
                  },
                  child: Text("Remover do carrinho",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(56, 56, 56, 1))),
                ),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}

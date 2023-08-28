import 'package:flutter/material.dart';

class TelaDetalhesProduto extends StatelessWidget {
  const TelaDetalhesProduto({super.key});

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
          child: Image.asset(
            "assets/images/Papelaria-1.png",
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
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
              fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ]),
    ));
  }
}

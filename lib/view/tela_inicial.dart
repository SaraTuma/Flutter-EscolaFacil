import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Center(
            child: Image.asset("assets/images/logo.png"),
          ),
          Container(
            height: 55,
            width: 280,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Começar",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(25, 200, 224, 1))),
            ),
          )
        ]));
  }
}

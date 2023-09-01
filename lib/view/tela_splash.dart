import 'package:flutter/material.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5))
        .then((_) => Navigator.of(context).pushReplacementNamed("/inicial"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            CircularProgressIndicator(
              color: Color.fromRGBO(25, 95, 224, 1)
            )
          ],
        )));
  }
}

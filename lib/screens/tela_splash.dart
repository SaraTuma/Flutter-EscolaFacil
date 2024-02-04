import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/user_repository.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    super.initState();
    initValuesNow();
  }

  Future<void> initValuesNow() async {
    await context.read<UserRepository>().initUsers();
    Future.delayed(const Duration(seconds: 2))
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
            CircularProgressIndicator(color: Color.fromRGBO(25, 95, 224, 1))
          ],
        )));
  }
}

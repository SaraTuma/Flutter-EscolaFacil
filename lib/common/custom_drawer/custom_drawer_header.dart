import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_escola_facil/models/user_model.dart';
import 'package:provider/provider.dart';

import '../../repository/user_repository.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = context.read<UserRepository>().currentUser;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 16, 8),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 130,
              width: 130,
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Text(
            'Olá, ${user?.name ?? ''}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              if (user != null) {
                context.read<UserRepository>().logOut();
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushNamed('/login');
              }
            },
            child: Text(
              user != null ? 'Sair' : 'Entre ou cadastre-se >',
              style: TextStyle(
                  color: const Color.fromRGBO(25, 200, 224, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

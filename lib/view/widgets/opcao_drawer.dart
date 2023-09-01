import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(25, 200, 224, 1)),
            accountEmail: Text("user@mail.com"),
            accountName: Text(
              "Sara Tuma",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              child: Text("ST"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Inicio",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/principal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_card),
            title: const Text(
              "Adicionar produto",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: const Text(
              "Carrinho",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/carrinho');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: const Text(
              "Encomendas",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/encomenda');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text(
              "Perfil",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: const Text(
              "Idioma",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text(
              "Sair",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(219, 32, 32, 32),
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.page});
  final int page;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: const [
        CustomDrawerHeader(),
        DrawerTile(
          iconData: Icons.home,
          title: "Inicio",
          route: "/principal",
          color: Color.fromARGB(219, 32, 32, 32),
        ),
        DrawerTile(
            iconData: Icons.list,
            title: "Produtos",
            route: "/product",
            color: Color.fromARGB(219, 32, 32, 32)),
        DrawerTile(
            iconData: Icons.shopping_cart,
            title: "Carrinho",
            route: "/carrinho",
            color: Color.fromARGB(219, 32, 32, 32)),
        DrawerTile(
            iconData: Icons.playlist_add_check,
            title: "Meus pedidos",
            route: "/encomendas",
            color: Color.fromARGB(219, 32, 32, 32)),
        //DrawerTile(iconData: Icons.shopping_bag, title: "Encomendas"),
        DrawerTile(
            iconData: Icons.person,
            title: "Perfil",
            route: "/principal",
            color: Color.fromARGB(219, 32, 32, 32)),
        DrawerTile(
            iconData: Icons.language,
            title: "Idioma",
            route: "/principal",
            color: Color.fromARGB(219, 32, 32, 32)),
        DrawerTile(
            iconData: Icons.location_on,
            title: "Loja",
            route: "/principal",
            color: Color.fromARGB(219, 32, 32, 32)),
      ]),
    );
  }
  // se a page 1 retorna
}

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.route, required this.color});

  final IconData iconData;
  final String title;
  final String route;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(219, 32, 32, 32),
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}

import 'package:astronauta/home/ui/menu.dart';
import 'package:astronauta/themes/astronauta_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secundaryColor,
      appBar: AppBar(
        title: const Text("Astronauta"),
      ),
      body: const MenuComponent(),
    );
  }
}

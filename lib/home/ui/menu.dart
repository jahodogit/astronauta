import 'package:astronauta/themes/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({Key? key}) : super(key: key);

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextButton(
              onPressed: () => Navigator.of(context).pushNamed("/islands"),
              child: Row(
                children: const [
                  Icon(Icons.games),
                  SizedBox(width: 20),
                  Text(
                    "Islands",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () => Navigator.of(context).pushNamed("/restaurant"),
              child: Row(
                children: const [
                  Icon(Icons.food_bank),
                  SizedBox(width: 20),
                  Text(
                    "Restaurant",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () => themeProvider.switchTheme(),
              child: Row(
                children: const [
                  Icon(Icons.design_services),
                  SizedBox(width: 20),
                  Text(
                    "Switch theme",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

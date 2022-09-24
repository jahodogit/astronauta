import 'package:flutter/material.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({Key? key}) : super(key: key);

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}

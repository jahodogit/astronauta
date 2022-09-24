import 'package:astronauta/island_module/model/spot.dart';
import 'package:astronauta/island_module/provider/island_provider.dart';
import 'package:astronauta/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IslandTablePage extends StatefulWidget {
  const IslandTablePage({Key? key}) : super(key: key);

  @override
  State<IslandTablePage> createState() => _IslandTablePageState();
}

class _IslandTablePageState extends State<IslandTablePage> {
  @override
  Widget build(BuildContext context) {
    IslandProvider _islandProvider = Provider.of<IslandProvider>(context);

    return Scaffold(
        backgroundColor: secundaryColor,
        appBar: AppBar(
          title: const Text("Islands"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _islandProvider.world.isNotEmpty ? buidTable(context, _islandProvider) : SizedBox(),
            buildPanel(_islandProvider),
          ],
        ));
  }

  Column buildPanel(IslandProvider islandProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Island counter",
          style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "21",
          style: TextStyle(color: primaryColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              islandProvider.builMatrix(5, 6);
            },
            child: Row(
              children: const [
                Icon(Icons.add_box),
                Text("Reset matrix"),
              ],
            ))
      ],
    );
  }

  Widget buidTable(BuildContext context, IslandProvider islandProvider) {
    int col, row = 0;
    int columnLength = islandProvider.world[0].length;
    int allLength = islandProvider.world.length * islandProvider.world[0].length;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          color: primaryColor,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              ...islandProvider.world.map((list) {
                return Row(
                  children: [
                    ...list.map((spot) => GestureDetector(
                          onDoubleTap: () => islandProvider.changeSpot(spot),
                          child: Image.asset(spot.image, fit: BoxFit.cover),
                        ))
                  ],
                );
              })
            ],
          )),
    );
  }
}

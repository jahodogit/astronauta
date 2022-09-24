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
            buidTable(context, _islandProvider),
            buildPanel(),
          ],
        ));
  }

  Column buildPanel() {
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
            onPressed: () {},
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
    int x, y = 0;
    int columnLength = islandProvider.world[0].length;
    int allLength = islandProvider.world.length * islandProvider.world[0].length;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: primaryColor,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.8,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //childAspectRatio: 1 / 0.2,
            //mainAxisExtent: 20,
            crossAxisCount: columnLength,
          ),
          itemCount: allLength,
          itemBuilder: (BuildContext context, int index) {
            x = (index / allLength).floor();
            y = (index % columnLength);

            Spot spot = islandProvider.world[x][y];

            return GestureDetector(
              onDoubleTap: () => islandProvider.changeSpot(spot),
              child: Container(
                color: Colors.blue[800],
                child: Center(child: Image.asset(spot.image)),
              ),
            );
          },
        ),
      ),
    );
  }
}

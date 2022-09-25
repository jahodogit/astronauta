import 'package:astronauta/island_module/provider/island_provider.dart';
import 'package:astronauta/themes/astronauta_theme.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _islandProvider.world.isNotEmpty ? buidTable(context, _islandProvider) : const SizedBox(),
            buildPanel(_islandProvider),
          ],
        ));
  }

  Widget buildPanel(IslandProvider islandProvider) {
    final TextEditingController _rowsFieldController = TextEditingController();
    final TextEditingController _columnsFieldController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Island counter",
          style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          islandProvider.islandCounter.toString(),
          style: TextStyle(color: primaryColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          color: primaryColorLigth,
          width: MediaQuery.of(context).size.width / 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _rowsFieldController,
                decoration: InputDecoration(
                  labelText: "# rows",
                  border: textFieldBorderDecoration,
                  focusedBorder: textFieldBorderDecoration,
                  labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.normal),
                ),
              ),
              TextFormField(
                controller: _columnsFieldController,
                decoration: InputDecoration(
                  labelText: "# columns",
                  border: textFieldBorderDecoration,
                  focusedBorder: textFieldBorderDecoration,
                  labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          color: primaryColorLigth,
          child: TextButton(
              onPressed: () {
                islandProvider.builMatrix(
                  int.parse(_columnsFieldController.text),
                  int.parse(_rowsFieldController.text),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.update),
                  Text("Reset matrix"),
                ],
              )),
        ),
        const SizedBox(height: 20),
        Container(
          color: primaryColorLigth,
          child: TextButton(
              onPressed: () {
                islandProvider.getNumberIslands();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.update),
                  Text("Calculate"),
                ],
              )),
        ),
      ],
    );
  }

  Widget buidTable(BuildContext context, IslandProvider islandProvider) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          color: primaryColor,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...islandProvider.world.map((list) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...list.map((spot) => GestureDetector(
                            onTap: () {
                              islandProvider.changeSpot(spot);
                            },
                            child: Column(
                              children: [
                                Container(
                                  color: spot.type ? Colors.green : Colors.blue,
                                  width: 30,
                                  height: 30,
                                ),
                                //Text(spot.type.toString()),
                                //Text(spot.visited.toString())
                              ],
                            ),
                          ))
                    ],
                  );
                })
              ],
            ),
          )),
    );
  }
}

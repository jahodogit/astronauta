import 'package:astronauta/theme/theme.dart';
import 'package:flutter/material.dart';

class IslandTablePage extends StatefulWidget {
  const IslandTablePage({Key? key}) : super(key: key);

  @override
  State<IslandTablePage> createState() => _IslandTablePageState();
}

class _IslandTablePageState extends State<IslandTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secundaryColor,
        appBar: AppBar(
          title: const Text("Islands"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buidTable(context),
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

  Widget buidTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: primaryColor,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.8,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 0.2,
            mainAxisExtent: 20,
            crossAxisCount: 10,
          ),
          itemCount: 500,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onDoubleTap: () => print("Double tap"),
              child: Container(
                color: Colors.blue[800],
                child: Center(child: Text(index.toString())),
              ),
            );
          },
        ),
      ),
    );
  }
}

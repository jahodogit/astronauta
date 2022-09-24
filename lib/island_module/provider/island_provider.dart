import 'package:flutter/foundation.dart';
import 'package:astronauta/island_module/model/spot.dart';

class IslandProvider extends ChangeNotifier {
  List<List<Spot>> world = [];
  String water = "assets/water.png";
  String dust = "assets/dust.png";

  builMAtrix(int rows, int columns) {
    for (int i = 0; i < rows; i++) {
      world.add(List.generate(columns, (int index) => Spot(xPosition: index, yPosition: i)));
    }

    notifyListeners();
  }

  void changeSpot(Spot spot) {
    spot.type = spot.type ? false : true;
    spot.image = spot.type ? water : dust;
    notifyListeners();
  }
}

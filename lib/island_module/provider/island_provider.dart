import 'package:flutter/foundation.dart';
import 'package:astronauta/island_module/model/spot.dart';

class IslandProvider extends ChangeNotifier {
  List<List<Spot>> world = [];
  String water = "assets/water.png";
  String land = "assets/dust.png";

  builMatrix(int x, int y) {
    world = List.generate(y, (rows) {
      return List<Spot>.generate(x, (cols) {
        var spot = Spot(xPosition: rows, yPosition: cols);
        //print("$rows - $");
        //print("${spot.xPosition} - ${spot.yPosition}");
        return spot;
      }, growable: true);
    }, growable: true);

    /*
    for (int i = 0; i < y; i++) {
      for (int j = 0; j < x; j++) {
        world[i][j].xPosition = j;
        world[i][j].yPosition = i;
        print(j);
      }
    }*/

    notifyListeners();
  }

  void changeSpot(Spot spot) {
    spot.type = spot.type ? false : true;
    spot.image = spot.type ? water : land;
    notifyListeners();
  }
}

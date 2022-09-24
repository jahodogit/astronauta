import 'package:flutter/foundation.dart';
import 'package:astronauta/island_module/model/spot.dart';

class IslandProvider extends ChangeNotifier {
  List<List<Spot>> world = [];
  String water = "assets/water.png";
  String land = "assets/dust.png";

  void builMatrix(int x, int y) {
    //First generate rows list
    world = List.generate(y, (rows) {
      //Second generate columns lists
      return List<Spot>.generate(x, (cols) {
        //Tird construct a spot for each column
        var spot = Spot(xPosition: rows, yPosition: cols);
        return spot;
      }, growable: true);
    }, growable: true);

    notifyListeners();
  }

  void changeSpot(Spot spot) {
    spot.type = spot.type ? false : true;
    spot.image = spot.type ? water : land;
    notifyListeners();
  }
}

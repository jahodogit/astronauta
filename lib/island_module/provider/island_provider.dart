import 'package:flutter/foundation.dart';
import 'package:astronauta/island_module/model/spot.dart';

class IslandProvider extends ChangeNotifier {
  List<List<Spot>> world = [];
  int rows = 0;
  int columns = 0;
  int islandCounter = 0;
  String water = "assets/water.png";
  String land = "assets/dust.png";

  List<Spot> visitedSpot = [];

  void builMatrix(int col, int row) {
    rows = row;
    columns = col;
    //First generate rows list
    world = List.generate(row, (rowsIndex) {
      //Second generate columns lists
      return List<Spot>.generate(col, (colsIndex) {
        //Tird construct a spot for each column
        var spot = Spot(xPosition: rowsIndex, yPosition: colsIndex);
        return spot;
      }, growable: true);
    }, growable: true);

    notifyListeners();
  }

  void changeSpot(Spot spot) {
    spot.type = spot.type ? false : true;
    getNumberIslands();
    //notifyListeners();
  }

  void getNumberIslands() {
    islandCounter = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        var spot = world[i][j];
        if (spot.type && !spot.visited) {
          validateNeighboors(i, j, spot);
          islandCounter++;
        }
      }
    }
    deleteVisitedSpots();
    notifyListeners();
  }

  void validateNeighboors(int row, int col, Spot spot) {
    List<int> rowDirections = [-1, -1, -1, 0, 0, 1, 1, 1];
    List<int> colDirections = [-1, 0, 1, -1, 1, -1, 0, 1];

    spot.visited = true;

    for (int n = 0; n < rowDirections.length; n++) {
      if (row + rowDirections[n] >= 0 &&
          row + rowDirections[n] < rows &&
          col + colDirections[n] >= 0 &&
          col + colDirections[n] < columns &&
          (world[row + rowDirections[n]][col + colDirections[n]].type && !world[row + rowDirections[n]][col + colDirections[n]].visited)) {
        var nextSpot = world[row + rowDirections[n]][col + colDirections[n]];
        validateNeighboors(row + rowDirections[n], col + colDirections[n], nextSpot);
      }
    }
  }

  void deleteVisitedSpots() {
    for (var list in world) {
      for (var spot in list) {
        spot.visited = false;
      }
    }
    notifyListeners();
  }
}

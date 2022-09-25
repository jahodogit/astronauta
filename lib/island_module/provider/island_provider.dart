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
    //First, generate rows list
    world = List.generate(row, (rowsIndex) {
      //Second, generate columns lists
      return List<Spot>.generate(col, (colsIndex) {
        //Tird, construct a spot for each column
        var spot = Spot(xPosition: rowsIndex, yPosition: colsIndex);
        return spot;
      }, growable: true);
    }, growable: true);

    notifyListeners();
  }

  void changeSpot(Spot spot) {
    spot.type = spot.type ? false : true;

    getNumberIslands();
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
    //Reset
    deleteVisitedSpots();
    notifyListeners();
  }

  void validateNeighboors(int row, int col, Spot spot) {
    /*
    Pairs to check neighbors
    
    -1,-1 => Left above diagonal
    -1,0 => Left
    -1,1 => Left under diagonal
    0,-1 => Above
    0,1 => Under
    1,-1 => Right above diagonal
    1,0 => Right
    1,1 => Right under diagonal
    */
    List<int> rowDirections = [-1, -1, -1, 0, 0, 1, 1, 1];
    List<int> colDirections = [-1, 0, 1, -1, 1, -1, 0, 1];

    spot.visited = true;

    for (int n = 0; n < rowDirections.length; n++) {
      if (row + rowDirections[n] >= 0 && //To validate row megative out of range
          row + rowDirections[n] < rows && //To validate row positive out of range
          col + colDirections[n] >= 0 && //To validate column megative out of range
          col + colDirections[n] < columns && //To validate column positive out of range

          ((world[row + rowDirections[n]][col + colDirections[n]].type) && //To validate if it's a land
              (!world[row + rowDirections[n]][col + colDirections[n]].visited) //To validate if the spot was visited
          )) {
        var nextSpot = world[row + rowDirections[n]][col + colDirections[n]];
        validateNeighboors(row + rowDirections[n], col + colDirections[n], nextSpot); //Recursive call
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

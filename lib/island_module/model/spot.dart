class Spot {
  int? xPosition;
  int? yPosition;
  bool type;
  String image;
  bool visited;

  Spot({this.xPosition, this.yPosition, this.type = false, this.image = "assets/water.png", this.visited = false});
}

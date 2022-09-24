class Spot {
  int? xPosition;
  int? yPosition;
  bool type;
  String image;

  Spot({this.xPosition, this.yPosition, this.type = false, this.image = "assets/water.png"});

  Spot.from(Spot spot)
      : xPosition = spot.xPosition,
        yPosition = spot.yPosition,
        type = spot.type,
        image = spot.image;
}

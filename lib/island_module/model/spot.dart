class Spot {
  final int xPosition;
  final int yPosition;
  bool type;
  String image;

  Spot({required this.xPosition, required this.yPosition, this.type = false, this.image = "assets/runner.png"});
}

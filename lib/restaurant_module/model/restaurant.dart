class Restaurant {
  final String id;
  final String title;
  final String image;

  Restaurant({required this.id, required this.title, required this.image});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      title: json['title'],
      image: json['images']['fixed_height']['url'],
    );
  }
}

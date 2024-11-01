class Point {
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  bool visited = false;

  Point({
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      title: json['title'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

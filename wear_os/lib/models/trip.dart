import 'point.dart';

class Trip {
  final List<Point> points;

  Trip(this.points);

  factory Trip.fromJson(List<dynamic> json) {
    return Trip(json.map((point) => Point.fromJson(point)).toList());
  }
}

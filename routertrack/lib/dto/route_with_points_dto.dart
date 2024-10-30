import '../database/database.dart';

class RouteWithPoints {
  final Route route;
  final List<PointsOfInterest> pointsOfInterest;

  RouteWithPoints({
    required this.route,
    required this.pointsOfInterest,
  });

  RouteWithPoints.fromJson(Map<String, dynamic> json)
      : route = Route.fromJson(json['route']),
        pointsOfInterest = List<PointsOfInterest>.from(
          json['pointsOfInterest'].map((x) => PointsOfInterest.fromJson(x)
        ));

  Map<String, dynamic> toJson() => {
    'route': route.toJson(),
    'pointsOfInterest': List<dynamic>.from(pointsOfInterest.map((x) => x.toJson())),
  };
}

import '../database/database.dart';

class RouteWithPoints {
  final Route route;
  final List<PointsOfInterest> pointsOfInterest;

  RouteWithPoints({
    required this.route,
    required this.pointsOfInterest,
  });
}

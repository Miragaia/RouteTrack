import 'package:equatable/equatable.dart';
import 'package:routertrack/repository/route_repository.dart';

import '../../database/database.dart';

abstract class RouteCartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RouteCartStarted extends RouteCartEvent {}
final class RouteEventClearPointsOfInterestEntries extends RouteCartEvent {}

final class RouteCartPointOfInterestAdded extends RouteCartEvent {
  RouteCartPointOfInterestAdded({required this.pointsOfInterest});
  final PointsOfInterest pointsOfInterest;

  @override
  List<Object?> get props => [pointsOfInterest];
}

final class RouteCartPointOfInterestRemoved extends RouteCartEvent {
  RouteCartPointOfInterestRemoved({required this.pointsOfInterestEntry});
  final PointsOfInterestEntry pointsOfInterestEntry;

  @override
  List<Object?> get props => [pointsOfInterestEntry];
}



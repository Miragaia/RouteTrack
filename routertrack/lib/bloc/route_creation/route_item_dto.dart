import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:routertrack/database/database.dart';

class RouteItemDTO extends Equatable{
  final String title;
  final String description;
  final double latitude;
  final double longitude;

  const RouteItemDTO({
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  PointsOfInterestsCompanion toPointsOfInterestEntity() {
    return PointsOfInterestsCompanion.insert(
      title: title,
      description: description,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  List<Object?> get props => [title, description, latitude, longitude];
}
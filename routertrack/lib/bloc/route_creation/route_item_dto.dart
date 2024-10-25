import 'package:equatable/equatable.dart';

class RouteItemDTO extends Equatable{
  String name;
  String country;
  double latitude;
  double longitude;

  RouteItemDTO({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, country, latitude, longitude];
}
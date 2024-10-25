import 'package:equatable/equatable.dart';

class RouteItemDTO extends Equatable{
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  const RouteItemDTO({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, country, latitude, longitude];
}
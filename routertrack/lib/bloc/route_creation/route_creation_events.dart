import 'package:equatable/equatable.dart';
import 'package:routertrack/bloc/route_creation/route_item_dto.dart';
import '../../repository/route_repository.dart';

abstract class RouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RouteStarted extends RouteEvent {}
final class RouteCleared extends RouteEvent {}

final class RouteEntryAdded extends RouteEvent {
  RouteEntryAdded({required this.routeItem});
  final RouteItemDTO routeItem;

  @override
  List<Object?> get props => [routeItem];
}

final class RouteEntryRepeated extends RouteEvent {
  RouteEntryRepeated({required this.routeItem});
  final RouteItemDTO routeItem;

  @override
  List<Object?> get props => [routeItem];
}

final class RouteEntryRemoved extends RouteEvent {
  RouteEntryRemoved({required this.routeItemEntry});
  final RouteItemEntry routeItemEntry;

  @override
  List<Object?> get props => [routeItemEntry];
}

final class RouteEntryClear extends RouteEvent {
  RouteEntryClear();

  @override
  List<Object?> get props => [];
}



import 'package:equatable/equatable.dart';
import 'package:routertrack/dto/route_item_dto.dart';
import '../../repository/route_repository.dart';

abstract class RouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RouteStarted extends RouteEvent {}

final class RouteEntryAdded extends RouteEvent {
  RouteEntryAdded({required this.routeItem});
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

final class RouteSubstituted extends RouteEvent {
  RouteSubstituted({required this.routeItemEntries});
  final List<RouteItemDTO> routeItemEntries;

  @override
  List<Object?> get props => [routeItemEntries];
}

final class RoutePersisted extends RouteEvent {}


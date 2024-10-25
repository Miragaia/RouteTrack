import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/bloc/route_creation/route_creation_events.dart';
import 'package:routertrack/bloc/route_creation/route_creation_state.dart';
import 'package:routertrack/bloc/route_creation/route_item_dto.dart';
import '../../repository/route_repository.dart';

class RouteCreationBloc extends Bloc<RouteEvent, RouteState>{

  RouteCreationBloc({required this.routeRepository}) : super(RouteStateCreated(routeRepository.routeItemEntries)) {
    on<RouteStarted>(_onRouteStarted);
    on<RouteEntryAdded>(_onRouteEntryAdded);
    on<RouteEntryRemoved>(_onRouteEntryRemoved);
    on<RouteEntryClear>(_onRouteEntryClear);
  }

  final RouteRepository routeRepository;

  void _onRouteStarted(RouteStarted event, Emitter<RouteState> emit) {}

  void _onRouteEntryAdded(RouteEntryAdded event, Emitter<RouteState> emit) {
    RouteItemEntry? firstRepeated = routeRepository.routeItemEntries
        .firstWhereOrNull((entry) => entry.routeItem == event.routeItem);
    if (firstRepeated != null) {
      emit(RouteStateRepeated(routeRepository.routeItemEntries, firstRepeated));
      return;
    }
    routeRepository.addRouteItemEntry(RouteItemEntry(event.routeItem));
    emit(RouteStateCreated(routeRepository.routeItemEntries));
  }

  void _onRouteEntryRemoved(RouteEntryRemoved event, Emitter<RouteState> emit) {
    routeRepository.removeRouteItemEntry(event.routeItemEntry);
  }

  void _onRouteEntryClear(RouteEntryClear event, Emitter<RouteState> emit) {
    routeRepository.clearIntermediateRouteItemEntries();
    emit(RouteStateCleared(routeRepository.routeItemEntries));
  }

}
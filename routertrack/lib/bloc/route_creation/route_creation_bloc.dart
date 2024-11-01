import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/bloc/route_creation/route_creation_events.dart';
import 'package:routertrack/bloc/route_creation/route_creation_state.dart';
import 'package:routertrack/repository/database_repository.dart';
import '../../repository/route_repository.dart';

class RouteCreationBloc extends Bloc<RouteEvent, RouteState>{

  RouteCreationBloc({
    required this.routeRepository,
    required this.routePersistenceRepository
  }) : super(RouteStateCreated(routeRepository.routeItemEntries, routeRepository.routeItemEntries.last)) {
    on<RouteStarted>(_onRouteStarted);
    on<RouteEntryAdded>(_onRouteEntryAdded);
    on<RouteEntryRemoved>(_onRouteEntryRemoved);
    on<RouteEntryClear>(_onRouteEntryClear);
    on<RouteSubstituted>(_onRouteSubstituted);
    on<RoutePersisted>(_onRoutePersisted);
  }

  final RouteCreationRepository routeRepository;
  final RoutePersistenceRepository routePersistenceRepository;

  void _onRouteStarted(RouteStarted event, Emitter<RouteState> emit) {}

  void _onRouteEntryAdded(RouteEntryAdded event, Emitter<RouteState> emit) {
    RouteItemEntry? firstRepeated = routeRepository.routeItemEntries
        .firstWhereOrNull((entry) => entry.routeItem == event.routeItem);
    if (firstRepeated != null) {
      emit(RouteStateRepeated(routeRepository.routeItemEntries, firstRepeated));
      return;
    }
    RouteItemEntry newRouteItemEntry = RouteItemEntry(event.routeItem);
    routeRepository.addRouteItemEntry(newRouteItemEntry);
    emit(RouteStateCreated(routeRepository.routeItemEntries, newRouteItemEntry));
  }

  void _onRouteEntryRemoved(RouteEntryRemoved event, Emitter<RouteState> emit) {
    routeRepository.removeRouteItemEntry(event.routeItemEntry);
  }

  void _onRouteEntryClear(RouteEntryClear event, Emitter<RouteState> emit) {
    routeRepository.clearIntermediateRouteItemEntries();
    emit(RouteStateCleared(routeRepository.routeItemEntries));
  }

  void _onRouteSubstituted(RouteSubstituted event, Emitter<RouteState> emit){
    routeRepository.replaceAllRouteItemEntries(
      event.routeItemEntries
          .map((routeItemDTO) => RouteItemEntry(routeItemDTO))
          .toList()
    );
    emit(RouteStateCreated(
        routeRepository.routeItemEntries,
        routeRepository.routeItemEntries.last
    ));
  }

  void _onRoutePersisted(RoutePersisted event, Emitter<RouteState> emit) {
    routePersistenceRepository.addRouteWithPointsOfInterest(
      routeRepository.routeItemEntries.map(
        (entry) => entry.routeItem.toPointsOfInterestEntity()
      ).toList()
    );
    emit(RouteStatePersisted(routeRepository.routeItemEntries));
  }

}
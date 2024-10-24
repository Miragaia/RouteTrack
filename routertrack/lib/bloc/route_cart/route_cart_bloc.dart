import 'package:drift/drift.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/bloc/route_cart/route_cart_events.dart';
import 'package:routertrack/bloc/route_cart/route_cart_state.dart';
import '../../database/database.dart';
import '../../repository/route_repository.dart';

class RouteCartBloc extends Bloc<RouteCartEvent, RouteCartState>{

  RouteCartBloc({required this.routeRepository}) : super(RouteCartCreated(routeRepository.pointsOfInterestLinkedList)) {
    on<RouteCartStarted>(_onRouteCartStarted);
    on<RouteCartPointOfInterestAdded>(_onRouteCartEntryAdded);
    on<RouteCartPointOfInterestRemoved>(_onRouteCartEntryRemoved);
  }

  final RouteRepository routeRepository;

  void _onRouteCartStarted(RouteCartStarted event, Emitter<RouteCartState> emit) {}

  void _onRouteCartEntryAdded(RouteCartPointOfInterestAdded event, Emitter<RouteCartState> emit) {
    PointsOfInterest? firstRepeated = routeRepository.pointsOfInterestLinkedList
        .map((entry) => entry.pointsOfInterest)
        .firstWhereOrNull((poi) => poi == event.pointsOfInterest);
    if (firstRepeated != null) {
      print(firstRepeated.name + ' already exists in the list');
      // emit(RouteCartEntryRepeated(firstRepeated));
      return;
    }
    routeRepository.addPointOfInterestEntry(event.pointsOfInterest);
    emit(RouteCartCreated(routeRepository.pointsOfInterestLinkedList));
  }

  void _onRouteCartEntryRepeated(RouteCartPointOfInterestRepeated event, Emitter<RouteCartState> emit) {}

  void _onRouteCartEntryRemoved(RouteCartPointOfInterestRemoved event, Emitter<RouteCartState> emit) {
    routeRepository.removePointOfInterestEntry(event.pointsOfInterestEntry);
  }

}
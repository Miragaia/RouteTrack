import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/bloc/route_cart/route_cart_events.dart';
import 'package:routertrack/bloc/route_cart/route_cart_state.dart';
import '../../repository/route_repository.dart';

class RouteCartBloc extends Bloc<RouteCartEvent, RouteCartState>{

  RouteCartBloc({required this.routeRepository}) : super(RouteCartCreated()) {
    on<RouteCartStarted>(_onRouteCartStarted);
    on<RouteCartPointOfInterestAdded>(_onRouteCartEntryAdded);
    on<RouteCartPointOfInterestRemoved>(_onRouteCartEntryRemoved);
  }

  final RouteRepository routeRepository;

  void _onRouteCartStarted(RouteCartStarted event, Emitter<RouteCartState> emit) {}

  void _onRouteCartEntryAdded(RouteCartPointOfInterestAdded event, Emitter<RouteCartState> emit) {
    print(event.pointsOfInterest);
    routeRepository.addPointOfInterestEntry(event.pointsOfInterest);
  }

  void _onRouteCartEntryRemoved(RouteCartPointOfInterestRemoved event, Emitter<RouteCartState> emit) {
    routeRepository.removePointOfInterestEntry(event.pointsOfInterestEntry);
  }

}
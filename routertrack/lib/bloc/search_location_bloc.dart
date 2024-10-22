import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationEvent {
  SearchLocationEvent(this.location);
  final LatLng location;
}

class SearchLocationBloc extends Bloc<SearchLocationEvent, LatLng> {
  SearchLocationBloc(super.initialLocation) {

    on<SearchLocationEvent>((event, emit) {
      print("Search Location Event");
      emit(event.location);
      return event.location;
    });

  }


}
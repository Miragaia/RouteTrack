import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routertrack/repository/route_repository.dart';
import 'package:routertrack/widgets/stores_map.dart';
import '../bloc/route_cart/route_cart_bloc.dart';
import '../bloc/search_location_bloc.dart';
import '../database/database.dart';
import '../widgets/modal_bottom_sheet.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final RouteRepository routeRepository = RouteRepository(
    PointsOfInterest(id: 2, name: "origin", latitude: 1, longitude: 1),
    PointsOfInterest(id: 3, name: "destination", latitude: 1, longitude: 1),
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchLocationBloc(const LatLng(0, 0)),
        child: Scaffold(
          body: const Center(
            child: RoutesMap(),
          ),
          bottomSheet: BlocProvider(
            create: (context) => RouteCartBloc(routeRepository: routeRepository),
            child: const RouteBottomSheet(),
          ),
        ),
      ),
    );
  }
}
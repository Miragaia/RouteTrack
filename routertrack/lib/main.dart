import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routertrack/repository/database_repository.dart';
import 'package:routertrack/repository/route_repository.dart';
import 'package:routertrack/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/route_creation/route_creation_bloc.dart';
import 'dto/route_item_dto.dart';
import 'bloc/search_location_bloc.dart';
import 'cubit/routes_cubit/routes_cubit.dart';
import 'database/database.dart';
import 'location/determine_position.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Position position = await determinePosition();
  runApp(MyApp(position));
}

class MyApp extends StatelessWidget {
  late final RouteCreationRepository routeRepository;
  late final RoutePersistenceRepository routePersistenceRepository;

  MyApp(Position position, {super.key}) {
     routeRepository = RouteCreationRepository(
      RouteItemDTO(
          title: "Origin",
          description: "Your Current Location: ${position.latitude}, ${position.longitude}",
          latitude: position.latitude,
          longitude: position.longitude
      ),
      RouteItemDTO(
          title: "Destination",
          description: "Your Current Location ${position.latitude}, ${position.longitude}",
          latitude: position.latitude,
          longitude: position.longitude
      ),
    );
    routePersistenceRepository = RoutePersistenceRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RouteCreationBloc(
            routeRepository: routeRepository,
            routePersistenceRepository: routePersistenceRepository,
          ),
        ),
        BlocProvider(
          create: (context) => SearchLocationBloc(const LatLng(0, 0)),
        ),
        BlocProvider(
          create: (context) => RoutesCubit(routePersistenceRepository),
        ),

      ],
      child: MaterialApp(
        title: 'RouterTrack',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}

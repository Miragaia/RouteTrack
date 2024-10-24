import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routertrack/repository/route_repository.dart';
import 'package:routertrack/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/route_cart/route_cart_bloc.dart';
import 'bloc/search_location_bloc.dart';
import 'database/database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteRepository routeRepository = RouteRepository(
    PointsOfInterest(id: 2, name: "origin", latitude: 1, longitude: 1),
    PointsOfInterest(id: 3, name: "destination", latitude: 1, longitude: 1),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RouteCartBloc(routeRepository: routeRepository),
        ),
        BlocProvider(
          create: (context) => SearchLocationBloc(const LatLng(0, 0)),
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

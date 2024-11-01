import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/repository/database_repository.dart';
import 'package:routertrack/repository/route_repository.dart';
import 'package:routertrack/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/route_creation/route_creation_bloc.dart';
import 'cubit/routes_cubit/routes_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RouteCreationRepository routeRepository = await RouteCreationRepository.create();
  RoutePersistenceRepository routePersistenceRepository = RoutePersistenceRepository();
  runApp(MyApp(
    routeRepository: routeRepository,
    routePersistenceRepository: routePersistenceRepository,
  ));
}

class MyApp extends StatelessWidget {
  final RouteCreationRepository routeRepository;
  final RoutePersistenceRepository routePersistenceRepository;

  const MyApp({super.key, required this.routeRepository, required this.routePersistenceRepository});

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

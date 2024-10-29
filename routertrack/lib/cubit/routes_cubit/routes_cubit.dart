import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/dto/route_with_points_dto.dart';
import 'package:routertrack/repository/database_repository.dart';

class RoutesCubit extends Cubit<List<RouteWithPoints>> {
  RoutesCubit(this.repository) : super([]) {
    _getRoutes();
  }

  final RoutePersistenceRepository repository;

  void _getRoutes() async {
    repository.watchRoutes().listen((routesWithPoints) {
      emit(routesWithPoints);
    });
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:routertrack/widgets/route_timeline.dart';

import '../cubit/routes_cubit/routes_cubit.dart';
import '../dto/route_with_points_dto.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(child: Scaffold(
      body: Center(
        child: BlocBuilder<RoutesCubit, List<RouteWithPoints>>(
          builder: (context, state){
            if (state.isEmpty) return const Text("No routes found");
            return RouteTimeline(routesWithPoints: state);
          }
        ),
      ),
    ));
  }
}
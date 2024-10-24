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

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: RoutesMap(),
        ),
        bottomSheet: const RouteBottomSheet(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routertrack/widgets/stores_map.dart';
import '../bloc/search_location_bloc.dart';
import '../widgets/modal_bottom_sheet.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchLocationBloc(const LatLng(0, 0)),
        child: const Scaffold(
          body: Center(
            child: RoutesMap(),
          ),
          bottomSheet: RouteBottomSheet(),
        ),
      ),
    );
  }
}
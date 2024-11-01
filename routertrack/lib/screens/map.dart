import 'package:flutter/material.dart';
import 'package:routertrack/widgets/CustomElevatedButton.dart';
import 'package:routertrack/widgets/routes_map.dart';
import '../widgets/route_bottom_sheet.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

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
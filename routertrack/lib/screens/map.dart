import 'package:flutter/material.dart';
import 'package:routertrack/widgets/stores_map.dart';
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
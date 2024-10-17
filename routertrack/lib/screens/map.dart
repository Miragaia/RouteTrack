import 'package:flutter/material.dart';
import 'package:routertrack/widgets/stores_map.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: StoresMap(),
        ),
      ),
    );
  }
} 
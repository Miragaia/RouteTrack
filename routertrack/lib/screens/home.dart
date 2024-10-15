import 'package:flutter/material.dart';
import 'package:routertrack/widgets/stores_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StoresMap(),
        ),
      ),
    );
  }
} 
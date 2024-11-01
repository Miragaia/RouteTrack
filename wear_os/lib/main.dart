import 'package:flutter/material.dart';
import 'pages/trip_tracker_page.dart';

void main() {
  runApp(const WearOSApp());
}

class WearOSApp extends StatelessWidget {
  const WearOSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TripTrackerPage(),
    );
  }
}

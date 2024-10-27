import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  runApp(const WearOSApp());
}

// Models for Trip and Point
class Point {
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  bool visited = false;

  Point({
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}

class Trip {
  final List<Point> points;

  Trip(this.points);
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

class TripTrackerPage extends StatefulWidget {
  const TripTrackerPage({Key? key}) : super(key: key);

  @override
  _TripTrackerPageState createState() => _TripTrackerPageState();
}

class _TripTrackerPageState extends State<TripTrackerPage> {
  static const platform = MethodChannel('location_permission');
  static const eventChannel = EventChannel('location_updates');
  Trip? trip;
  StreamSubscription<dynamic>? locationStream;
  final double proximityThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    _initializeTrip();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    locationStream?.cancel();
    super.dispose();
  }

  void _initializeTrip() {
    trip = Trip([
      Point(
        title: "Point 1",
        description: "A beautiful park",
        latitude: 40.6799,
        longitude: -7.9248,
      ),
      Point(
        title: "Point 2",
        description: "Historic landmark",
        latitude: 37.8044,
        longitude: -122.2711,
      ),
      // Add more points as needed
    ]);
  }

  Future<void> _startLocationUpdates() async {
    try {
      await platform.invokeMethod('requestPermission');
      final bool permissionGranted = await platform.invokeMethod('checkPermission');
      if (permissionGranted) {
        locationStream = eventChannel.receiveBroadcastStream().listen((event) {
          List<double> coords = _parseCoordinates(event);
          print("Coordinates: $coords");
          _checkProximityToPoints(coords[0], coords[1]);
        });
      }
    } on PlatformException catch (e) {
      print("Failed to start location updates: '${e.message}'.");
    }
  }

  List<double> _parseCoordinates(dynamic event) {
    var parts = (event as String).split(" ");
    return [double.parse(parts[0]), double.parse(parts[1])];
  }

  void _checkProximityToPoints(double latitude, double longitude) {
    for (var point in trip!.points) {
      if (!point.visited) {
        double distance = _calculateDistance(latitude, longitude, point.latitude, point.longitude);
        print('Distance to ${point.title}: $distance meters');

        if (distance <= proximityThreshold) {
          setState(() {
            point.visited = true;
          });
          _showNearbyNotification(point);
        }
      }
    }
  }

  double _calculateDistance(double startLat, double startLng, double endLat, double endLng) {
    const double earthRadius = 6371000; // meters
    double dLat = (endLat - startLat) * (math.pi / 180.0);
    double dLng = (endLng - startLng) * (math.pi / 180.0);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(startLat * (math.pi / 180.0)) *
            math.cos(endLat * (math.pi / 180.0)) *
            math.sin(dLng / 2) * math.sin(dLng / 2);

    return earthRadius * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }

  void _showNearbyNotification(Point point) {
    print('You are near ${point.title}: ${point.description}');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Nearby Point'),
        content: Text('You are near ${point.title}: ${point.description}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip Tracker')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: trip?.points.length ?? 0,
              itemBuilder: (context, index) {
                final point = trip!.points[index];
                return ListTile(
                  title: Text(point.title),
                  subtitle: Text(point.description),
                  trailing: Icon(
                    point.visited ? Icons.check_circle : Icons.location_on,
                    color: point.visited ? Colors.green : Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Approach each point to mark it as visited!',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

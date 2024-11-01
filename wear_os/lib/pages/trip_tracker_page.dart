import 'package:flutter/material.dart';
import '../models/point.dart';
import '../models/trip.dart';
import '../services/mqtt_service.dart';
import '../services/location_service.dart';
import '../widgets/direction_status_bar.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class TripTrackerPage extends StatefulWidget {
  const TripTrackerPage({Key? key}) : super(key: key);

  @override
  _TripTrackerPageState createState() => _TripTrackerPageState();
}

class _TripTrackerPageState extends State<TripTrackerPage> {
  Trip? trip;
  String directionStatus = 'Direction: Unknown';
  late MQTTService mqttService;
  late LocationService locationService;
  final double proximityThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    mqttService = MQTTService(MqttServerClient('broker.hivemq.com', 'flutter_client'));
    locationService = LocationService();
    
    mqttService.connect().then((_) {
      mqttService.subscribeToTripUpdates(_handleTripUpdate);
    });

    _startLocationUpdates();
  }

  void _handleTripUpdate(String message) {
    try {
      final List<dynamic> jsonData = jsonDecode(message);
      setState(() {
        trip = Trip.fromJson(jsonData);
      });
    } catch (e) {
      print('Error parsing trip data: $e');
    }
  }

  Future<void> _startLocationUpdates() async {
    try {
      // Request permission
      await locationService.requestPermission();

      // Check if permission is granted
      final bool permissionGranted = await locationService.checkPermission();
      if (permissionGranted) {
        // Start listening to location updates if permission is granted
        locationService.getLocationStream().listen((coords) {
          // List<double> coords = _parseCoordinates(event);
          print("Coordinates: $coords");
          _checkProximityToPoints(coords[0], coords[1]);
        });
      } else {
        print("Location permission not granted.");
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
    bool offRoute = false;

    for (var i = 0; i < (trip?.points.length ?? 0) - 1; i++) {
      var start = trip!.points[i];
      var end = trip!.points[i + 1];

      double distanceToLine = _calculateDistanceToLine(latitude, longitude, start, end);
      if (distanceToLine > proximityThreshold) {
        offRoute = true;
        break;
      }
    }

    setState(() {
      directionStatus = offRoute ? 'Wrong Direction' : 'Correct Direction';
    });

    for (var point in trip?.points ?? []) {
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

  void _showNearbyNotification(Point point) {
    print('You are near ${point.title}: ${point.description}');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nearby Point', style: TextStyle(fontSize: 16)),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            'You are near ${point.title}: ${point.description}',
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  double _calculateDistanceToLine(double lat, double lon, Point start, Point end) {
    const double earthRadius = 6371000; // meters

    double startLatRad = start.latitude * (math.pi / 180);
    double startLngRad = start.longitude * (math.pi / 180);
    double endLatRad = end.latitude * (math.pi / 180);
    double endLngRad = end.longitude * (math.pi / 180);
    double latRad = lat * (math.pi / 180);
    double lonRad = lon * (math.pi / 180);

    double d1 = _calculateDistance(start.latitude, start.longitude, lat, lon);
    double d2 = _calculateDistance(end.latitude, end.longitude, lat, lon);
    double d3 = _calculateDistance(start.latitude, start.longitude, end.latitude, end.longitude);

    double s = (d1 + d2 + d3) / 2;
    double area = math.sqrt(s * (s - d1) * (s - d2) * (s - d3));
    double distanceToLine = (2 * area) / d3;

    return distanceToLine;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Trip Tracker')),
      body: Column(
        children: [
          DirectionStatusBar(directionStatus: directionStatus),
          Expanded(
            child: ListView.builder(
              itemCount: trip?.points.length ?? 0,
              itemBuilder: (context, index) {
                final point = trip!.points[index];
                return ListTile(
                  title: Text(point.title),
                  subtitle: Text(point.description),
                  trailing: Icon(
                    point.visited ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: point.visited ? Colors.green : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mqttService.disconnect();
    super.dispose();
  }
}

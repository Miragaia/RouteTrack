import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

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

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      title: json['title'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Trip {
  final List<Point> points;

  Trip(this.points);

  factory Trip.fromJson(List<dynamic> json) {
    return Trip(json.map((point) => Point.fromJson(point)).toList());
  }
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
  final double proximityThreshold = 50.0;
  Trip? trip;
  StreamSubscription<dynamic>? locationStream;
  late MqttServerClient mqttClient;
  String directionStatus = 'Direction: Unknown';

  @override
  void initState() {
    super.initState();
    _connectToMQTTBroker();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    locationStream?.cancel();
    mqttClient.disconnect();
    super.dispose();
  }

  Future<void> _connectToMQTTBroker() async {
    mqttClient = MqttServerClient('broker.hivemq.com', 'wear_os_trip_tracker');
    mqttClient.port = 1883;
    mqttClient.keepAlivePeriod = 60;
    mqttClient.onConnected = _onConnected;
    mqttClient.onDisconnected = _onDisconnected;
    mqttClient.onSubscribed = _onSubscribed;
    mqttClient.logging(on: true);

    try {
      await mqttClient.connect();
    } catch (e) {
      print('MQTT connection failed: $e');
      mqttClient.disconnect();
    }
  }

  void _onConnected() {
    print('Connected to MQTT Broker');
    mqttClient.subscribe('trip/data', MqttQos.atMostOnce);
    mqttClient.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final MqttPublishMessage message = messages[0].payload as MqttPublishMessage;
      final payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
      print('Received message: $payload');
      _initializeTripFromMQTT(payload);
    });
  }

  void _onDisconnected() {
    print('Disconnected from MQTT Broker');
  }

  void _onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void _initializeTripFromMQTT(String payload) {
    try {
      final List<dynamic> jsonData = jsonDecode(payload);
      setState(() {
        trip = Trip.fromJson(jsonData);
      });
      print('Trip initialized with ${trip?.points.length} points');
    } catch (e) {
      print('Error parsing trip data: $e');
    }
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
        }
      }
    }
  }

  double _calculateDistanceToLine(double lat, double lon, Point start, Point end) {
    const double earthRadius = 6371000; // em metros

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
          Container(
            color: directionStatus == 'Correct Direction' ? Colors.green : Colors.red,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                directionStatus,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

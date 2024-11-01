import 'dart:async';
import 'package:flutter/services.dart';

class LocationService {
  static const MethodChannel platform = MethodChannel('location_permission');
  static const EventChannel eventChannel = EventChannel('location_updates');

  Future<void> requestPermission() async {
    await platform.invokeMethod('requestPermission');
  }

  Future<bool> checkPermission() async {
    return await platform.invokeMethod('checkPermission');
  }

  Stream<List<double>> getLocationStream() {
    return eventChannel.receiveBroadcastStream().map((event) {
      var parts = (event as String).split(" ");
      return [double.parse(parts[0]), double.parse(parts[1])];
    });
  }
}

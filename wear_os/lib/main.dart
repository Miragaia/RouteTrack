import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const WearOSApp());
}

class WearOSApp extends StatelessWidget {
  const WearOSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear OS Bluetooth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BluetoothListenerPage(),
    );
  }
}

class BluetoothListenerPage extends StatefulWidget {
  const BluetoothListenerPage({Key? key}) : super(key: key);

  @override
  _BluetoothListenerPageState createState() => _BluetoothListenerPageState();
}

class _BluetoothListenerPageState extends State<BluetoothListenerPage> {
  BluetoothDevice? connectedDevice;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() async {
    if (await Permission.bluetooth.isDenied) {
      await Permission.bluetooth.request();
    }
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
    _startListeningForConnectPrompt();
  }

  // Continuously check for a connected device from FlutterBluePlus
  void _startListeningForConnectPrompt() async {
    print('Listening for connection prompt...');
    setState(() {
      isScanning = true; // Show scanning status in the UI
    });

    _scanForDevices();
  }

  // Periodically check for connected devices
  void _scanForDevices() async {
    while (connectedDevice == null) {
      try {
        // Await the list of connected devices
        final List<BluetoothDevice> devices = await FlutterBluePlus.systemDevices([]);

        if (devices.isNotEmpty) {
          setState(() {
            connectedDevice = devices.first;
            isScanning = false; // Stop showing scanning status in the UI
          });
          print('Device found and connected: ${connectedDevice!.platformName}');
        } else {
          print('No devices connected yet. Retrying...');
          await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds before retrying
        }
      } catch (e) {
        print('Error while fetching connected devices: $e');
        setState(() {
          isScanning = false; // Stop scanning on error
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Listener (Wear OS)'),
      ),
      body: Center(
        child: connectedDevice != null
            ? Text('Connected to: ${connectedDevice!.platformName}')
            : isScanning
                ? const Text('Scanning for devices...')
                : const Text('Waiting for connection prompt...'),
      ),
    );
  }
}

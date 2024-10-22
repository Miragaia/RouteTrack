import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart'; // Add this package
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
  bool isListeningForConnectPrompt = false;
  // final String serviceUUID = "12345678-1234-5678-1234-567812345678"; // Replace with your actual Service UUID
  // FlutterBlePeripheral blePeripheral = FlutterBlePeripheral(); // Initialize peripheral package

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    // _startAdvertising();
  }

  //   // Start Bluetooth advertising
  // void _startAdvertising() {
    
  //   AdvertiseData advertiseData = AdvertiseData(
  //     serviceUuid: serviceUUID,
  //     localName: 'RouteTrack',
  //     manufacturerId: 1234,
  //     manufacturerData: Uint8List.fromList([1, 2, 3, 4, 5, 6]),
  //   );

  //   blePeripheral.start(advertiseData: advertiseData);
  //   print('Started advertising with UUID: $serviceUUID');
  // }

  // Request necessary permissions for Bluetooth
  void _requestPermissions() async {
    if (await Permission.bluetooth.isDenied) {
      await Permission.bluetooth.request();
    }
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
    _startListeningForConnectPrompt();
  }

  // Start scanning for Bluetooth devices and listen for a connection prompt
  // void _startListeningForConnectPrompt() {
  //   if (!isListeningForConnectPrompt && !isScanning) {
  //     FlutterBluePlus.startScan(
  //       withServices: [Guid(serviceUUID)], // Filter by specific Service UUID
  //     );
  //     isScanning = true;
  //     isListeningForConnectPrompt = true;

  //     FlutterBluePlus.scanResults.listen((results) {
  //       for (ScanResult result in results) {
  //         print('Device found: ${result.device.platformName}');
  //         // Check if the device advertises the required service UUID
  //         if (_hasServiceUUID(result)) {
  //           print('Device with service UUID detected: ${result.device.platformName}');
  //           FlutterBluePlus.stopScan();  // Stop scanning when a matching device is detected
  //           isScanning = false;
  //           _connectToDevice(result.device);
  //           break;
  //         }
  //       }
  //     });
  //   }
  // }

  // Awaits for a connection from FlutterBluePlus
  void _startListeningForConnectPrompt() {
    List<BluetoothDevice> devices = FlutterBluePlus.connectedDevices;
    for(var d in devices){
      print('Device found and connected: ${d.platformName}');
    }
  }

  // // Check if the device advertises the required Service UUID
  // bool _hasServiceUUID(ScanResult result) {
  //   List<Guid> serviceUuids = result.advertisementData.serviceUuids;
  //   print('Service UUIDs found: $serviceUuids');
  //   return serviceUuids.contains(Guid(serviceUUID));  // Check if our target UUID is advertised
  // }

  // // Connect to the detected device
  // void _connectToDevice(BluetoothDevice device) async {
  //   try {
  //     await device.connect(autoConnect: false);  // Ensure connection only when requested
  //     setState(() {
  //       connectedDevice = device;
  //     });
  //     print("Connected to ${device.platformName}");

  //     // After connecting, you can stop scanning and update the UI
  //     FlutterBluePlus.stopScan();
  //   } catch (e) {
  //     print("Error connecting to device: $e");
  //   }
  // }

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

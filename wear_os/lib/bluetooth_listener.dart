// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() {
//   runApp(const WearOSApp());
// }

// class WearOSApp extends StatelessWidget {
//   const WearOSApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wear OS Bluetooth',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const BluetoothListenerPage(),
//     );
//   }
// }

// class BluetoothListenerPage extends StatefulWidget {
//   const BluetoothListenerPage({Key? key}) : super(key: key);

//   @override
//   _BluetoothListenerPageState createState() => _BluetoothListenerPageState();
// }

// class _BluetoothListenerPageState extends State<BluetoothListenerPage> {
//   BluetoothDevice? connectedDevice;
//   bool isScanning = false;
//   Timer? _readTimer;

//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions();
//   }

//   void _requestPermissions() async {
//     if (await Permission.bluetooth.isDenied) {
//       await Permission.bluetooth.request();
//     }
//     if (await Permission.location.isDenied) {
//       await Permission.location.request();
//     }
//     _startListeningForConnectPrompt();
//   }

//   void _startListeningForConnectPrompt() async {
//     print('Listening for connection prompt...');
//     setState(() {
//       isScanning = true;
//     });
//     _scanForDevices();
//   }

//   void _scanForDevices() async {
//     while (connectedDevice == null) {
//       try {
//         final List<BluetoothDevice> devices = await FlutterBluePlus.systemDevices([]);
//         if (devices.isNotEmpty) {
//           setState(() {
//             connectedDevice = devices.first;
//             isScanning = false;
//             print('Device found and connected1: ${connectedDevice!.platformName}');
//           });
//           print('Device found and connected2: ${connectedDevice!.platformName}');
//           _startListeningForData(connectedDevice!);
//         } else {
//           print('No devices connected yet. Retrying...');
//           await Future.delayed(const Duration(seconds: 2));
//         }
//       } catch (e) {
//         print('Error while fetching connected devices: $e');
//         setState(() {
//           isScanning = false;
//         });
//         break;
//       }
//     }
//   }

//   void _startListeningForData(BluetoothDevice device) async {
//     print('Listening for data...');

//     try {
//       await device.connect();

//       List<BluetoothService> services = await device.discoverServices();
//       for (BluetoothService service in services) {
//         print('Service UUID: ${service.uuid}');
//         for (BluetoothCharacteristic characteristic in service.characteristics) {
//           print('Characteristic UUID: ${characteristic.uuid}');
//           print('Properties: ${characteristic.properties}');

//           // Periodically read the characteristic if notify or indicate is not available
//           if (!characteristic.properties.notify && !characteristic.properties.indicate) {
//             if (characteristic.properties.read) {
//               _readTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
//                 try {
//                   List<int> data = await characteristic.read();
//                   print('Data read from smartphone1: $data');
//                   if (data.isNotEmpty) {
//                     print('Data read from smartphone2: $data');
//                   } else {
//                     print('No data available on read.');
//                   }
//                 } catch (e) {
//                   print('Error reading characteristic: $e');
//                   timer.cancel();
//                 }
//               });
//             }
//           }

//           // Write to the characteristic if required
//           if (characteristic.properties.write || characteristic.properties.writeWithoutResponse) {
//             print('Characteristic is writable. Smartphone can send data here.');
//           }
//         }
//       }

//       // Re-listen if disconnected
//       device.state.listen((state) {
//         if (state == BluetoothDeviceState.disconnected) {
//           print('Device disconnected, trying to reconnect...');
//           setState(() {
//             connectedDevice = null;
//           });
//           _scanForDevices();
//           _readTimer?.cancel(); // Stop the timer if device disconnects
//         }
//       });
//     } catch (e) {
//       print('Error listening for data: $e');
//       Future.delayed(Duration(seconds: 3), () => _startListeningForData(device));
//     }
//   }

//   @override
//   void dispose() {
//     _readTimer?.cancel(); // Cancel the timer when disposing
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Bluetooth Listener (Wear OS)')),
//       body: Center(
//         child: connectedDevice != null
//             ? Text('Connected to: ${connectedDevice!.platformName}')
//             : isScanning
//                 ? const Text('Scanning for devices...')
//                 : const Text('Waiting for connection prompt...'),
//       ),
//     );
//   }
// }

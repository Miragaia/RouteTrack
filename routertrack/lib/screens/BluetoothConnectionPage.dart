import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:routertrack/screens/SendLocationPage.dart';

class BluetoothConnectionPage extends StatefulWidget {
  @override
  _BluetoothConnectionPageState createState() => _BluetoothConnectionPageState();
}

class _BluetoothConnectionPageState extends State<BluetoothConnectionPage> {
  BluetoothDevice? connectedDevice;
  List<ScanResult> scanResults = [];
  List<BluetoothDevice> alreadyConnectedDevices = [];

  @override
  void initState() {
    super.initState();
    _getConnectedDevices();
  }

  // Method to get already connected Bluetooth devices
  void _getConnectedDevices() async {
    List<BluetoothDevice> devices = await FlutterBluePlus.connectedDevices;
    print('Already connected devices: $devices');
    setState(() {
      alreadyConnectedDevices = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect to Smartwatch'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              setState(() {
                scanResults.clear();
              });

              // Start scanning for Bluetooth devices
              FlutterBluePlus.startScan(timeout: Duration(seconds: 10));

              // Listen to scan results
              FlutterBluePlus.scanResults.listen((results) {
                setState(() {
                  scanResults = results;
                });
              });
            },
            child: Text('Scan for Smartwatch'),
          ),

          if (alreadyConnectedDevices.isNotEmpty)
            Column(
              children: [
                Text('Already Connected Devices:'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: alreadyConnectedDevices.length,
                  itemBuilder: (context, index) {
                    BluetoothDevice device = alreadyConnectedDevices[index];
                    return ListTile(
                      title: Text(device.platformName.isNotEmpty ? device.platformName : 'Unnamed Device'),
                      subtitle: Text(device.remoteId.toString()),
                    );
                  },
                ),
              ],
            ),
            if (connectedDevice == null)
            // Display scanned devices
            Expanded(
              child: ListView.builder(
                itemCount: scanResults.length,
                itemBuilder: (context, index) {
                  ScanResult result = scanResults[index];
                  return ListTile(
                    title: Text(result.device.platformName.isNotEmpty ? result.device.platformName : 'Unnamed Device'),
                    subtitle: Text(result.device.remoteId.toString()),
                    trailing: Text('RSSI: ${result.rssi}'),
                    onTap: () {
                      FlutterBluePlus.stopScan();
                      _connectToDevice(result.device);
                    },
                  );
                },
              ),
            ),

          if (connectedDevice != null)
            Column(
              children: [
                Text('Connected to: ${connectedDevice!.platformName}'),
                ElevatedButton(
                  onPressed: _disconnect,
                  child: Text('Disconnect'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(autoConnect: false);
      setState(() {
        connectedDevice = device;  
      });

      print('Connected to ${device.platformName}');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SendLocationPage(device: connectedDevice!),
        ),
      );
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  void _disconnect() async {
    await connectedDevice?.disconnect();
    setState(() {
      connectedDevice = null;
    });
  }
}

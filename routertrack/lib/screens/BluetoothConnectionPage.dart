import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothConnectionPage extends StatefulWidget {
  @override
  _BluetoothConnectionPageState createState() => _BluetoothConnectionPageState();
}

class _BluetoothConnectionPageState extends State<BluetoothConnectionPage> {
  BluetoothDevice? connectedDevice;
  List<ScanResult> scanResults = [];
  List<BluetoothDevice> alreadyConnectedDevices = [];
  StreamSubscription<List<int>>? _notificationSubscription;

  @override
  void initState() {
    super.initState();
    _getConnectedDevices();
  }

  void _getConnectedDevices() async {
    List<BluetoothDevice> devices = await FlutterBluePlus.connectedDevices;
    setState(() {
      alreadyConnectedDevices = devices;
    });
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel(); // cleanup on dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect to Smartwatch')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              setState(() {
                scanResults.clear();
              });
              FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Uint8List data = Uint8List.fromList([0x01, 0x02, 0x03, 0x04]);
                    await _sendDataToDevice(data);
                  },
                  child: Text('Send Data to Smartwatch'),
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
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  Future<void> _sendDataToDevice(Uint8List data) async {
    if (connectedDevice != null) {
      try {
        List<BluetoothService> services = await connectedDevice!.discoverServices();
        for (BluetoothService service in services) {
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.properties.write || characteristic.properties.writeWithoutResponse){
              print('Found writable characteristic: ${characteristic.uuid}');
              
              // Start listening to notifications
              await characteristic.setNotifyValue(true);
              print ('Listening to notifications from smartwatch ${characteristic.properties.notify}');
              _notificationSubscription = characteristic.onValueReceived.listen((value) {
                print('Received data from smartwatch: $value');
              });

              // Send data to the smartwatch
              await characteristic.write(data, allowLongWrite: true);
              print('Data sent to smartwatch: $data');
              return;
            }
          }
        }
        print('No writable characteristic found');
      } catch (e) {
        print('Error sending data: $e');
      }
    } else {
      print('No device connected');
    }
  }

  void _disconnect() async {
    await _notificationSubscription?.cancel();
    await connectedDevice?.disconnect();
    setState(() {
      connectedDevice = null;
    });
  }
}

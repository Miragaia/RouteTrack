import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SendLocationPage extends StatefulWidget {
  final BluetoothDevice device;

  const SendLocationPage({required this.device, Key? key}) : super(key: key);

  @override
  _SendLocationPageState createState() => _SendLocationPageState();
}

class _SendLocationPageState extends State<SendLocationPage> {
  List<String> locationPoints = ['Point 1', 'Point 2', 'Point 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Location Points'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: locationPoints.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(locationPoints[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _sendLocationPoints();
            },
            child: Text('Send Points to Watch'),
          ),
        ],
      ),
    );
  }

  void _sendLocationPoints() async {
    if (widget.device != null) {
      List<BluetoothService> services = await widget.device.discoverServices();
      // Locate the service and characteristic to write location data
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          // Assuming the smartwatch has a specific UUID for location data
          if (characteristic.properties.write) {
            for (String point in locationPoints) {
              await characteristic.write(point.codeUnits);
            }
            print('Location points sent.');
          }
        }
      }
    }
  }
}

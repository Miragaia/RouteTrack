import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  final MqttServerClient client;

  MQTTService(this.client);

  Future<void> connect() async {
    client.port = 1883;
    client.keepAlivePeriod = 60;
    client.onConnected = _onConnected;
    client.onDisconnected = _onDisconnected;
    client.onSubscribed = _onSubscribed;

    try {
      await client.connect();
    } catch (e) {
      print('MQTT connection failed: $e');
      client.disconnect();
    }
  }

  void _onConnected() {
    print('Connected to MQTT Broker');
  }

  void _onDisconnected() {
    print('Disconnected from MQTT Broker');
  }

  void _onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void subscribeToTripUpdates(Function(String) onTripUpdate) {
    client.subscribe('trip/data', MqttQos.atMostOnce);
    client.updates!.listen((messages) {
      final payload = MqttPublishPayload.bytesToStringAsString(
          (messages[0].payload as MqttPublishMessage).payload.message);
      onTripUpdate(payload);
    });
  }

  void disconnect() => client.disconnect();
}

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:routertrack/dto/route_with_points_dto.dart';
import 'package:routertrack/mycolors/colors.dart';
import 'package:routertrack/pdf_generator/route_pdf.dart';
import 'package:routertrack/widgets/generated_qr_code_dialog.dart';
import '../notifications/notification.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


class RouteTimeline extends StatefulWidget {
  const RouteTimeline({super.key, required this.routesWithPoints});

  final List<RouteWithPoints> routesWithPoints;

  @override
  State<RouteTimeline> createState() => _RouteTimelineState();
}

class _RouteTimelineState extends State<RouteTimeline> {
  late MqttServerClient mqttClient;


  @override
  void initState() {
    super.initState();
    _connectToMQTTBroker();
    Notif.initNotification(flutterLocalNotificationsPlugin);
  }

  Future<void> _connectToMQTTBroker() async {
    mqttClient = MqttServerClient('broker.hivemq.com', 'smartphone_trip_sender');
    mqttClient.port = 1883;
    mqttClient.keepAlivePeriod = 60;
    mqttClient.logging(on: true);

    try {
      await mqttClient.connect();
    } catch (e) {
      print('MQTT connection failed: $e');
      mqttClient.disconnect();
    }
  }

  void _sendDataToSmartwatch(RouteWithPoints route) {
    if (mqttClient.connectionStatus!.state == MqttConnectionState.connected) {
      final payload = jsonEncode(route.pointsOfInterest.map((point) => {
        'title': point.title,
        'description': point.description,
        'latitude': point.latitude,
        'longitude': point.longitude,
      }).toList());

      final builder = MqttClientPayloadBuilder();
      builder.addString(payload);
      mqttClient.publishMessage('trip/data', MqttQos.atMostOnce, builder.payload!);
      print('Data sent to smartwatch');
    } else {
      print('Failed to send data: MQTT is not connected');
    }
  }

  @override
  void dispose() {
    mqttClient.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.routesWithPoints.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 7.6, horizontal: 24),
          clipBehavior: Clip.hardEdge,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 39,
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Route ${index + 1}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColorPalette.darkGreen,
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final pdf = await generateRoutePdf(
                                routeName: "Route ${index + 1}",
                                routeData: jsonEncode(widget.routesWithPoints[index]),
                              );
                              final output = await getDownloadsDirectory();
                              final filename = "${output?.path}/route_${index+1}.pdf";
                              final file = File(filename);
                              await file.writeAsBytes(await pdf.save());
                              await Notif.showDownloadNotification(
                                fnp: flutterLocalNotificationsPlugin,
                                routeName: "Route ${index + 1}",
                                routeFilename: filename,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyColorPalette.forestGreen,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(40, 0)
                            ),
                            child: const Icon(Icons.download, color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () => qrCodeDialogBuilder(
                                context,
                                jsonEncode(widget.routesWithPoints[index])
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColorPalette.forestGreen,
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(40, 0)
                            ),
                            child: const Icon(Icons.qr_code, color: Colors.white,),
                          ),
                          const SizedBox(width: 4.5,),
                          ElevatedButton(
                            onPressed: () {
                              _sendDataToSmartwatch(widget.routesWithPoints[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColorPalette.forestGreen,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Send Data",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  key: Key(Random.secure().nextDouble().toString()), // needs to be constant to be clicked
                  stepIconBuilder: (stepIndex, stepState) => Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: stepState == StepState.complete ? MyColorPalette.forestGreen : Colors.grey,
                    ),
                    child: Center(
                      child: stepIndex == 0 ? const Icon(Icons.home, color: Colors.white, size: 16,) :
                      stepIndex ==  widget.routesWithPoints[index].pointsOfInterest.length - 1 ?
                      const Icon(Icons.flag, color: Colors.white, size: 16,) :
                      Text(
                        stepIndex.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  currentStep: widget.routesWithPoints[index].pointsOfInterest.length - 1,
                  type: StepperType.vertical, // Make it vertical like a timeline
                  onStepTapped: (int index){},
                  steps: widget.routesWithPoints[index].pointsOfInterest.indexed.map((item) {
                    final (index, entry) = item;

                    return Step(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.title,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: MyColorPalette.forestGreen,
                            ),
                          ),
                          Text(
                            entry.description,
                            style: TextStyle(
                              height: 1.2,
                              color: Color.fromARGB(255, 112, 112, 112),
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                      content: const SizedBox.shrink(),
                      isActive: true,
                      state: StepState.complete,
                    );
                  }).toList(),
                  controlsBuilder: (BuildContext context, ControlsDetails controls) {
                    // Remove default buttons to mimic timeline
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:routertrack/bloc/route_creation/route_creation_bloc.dart';
import 'package:routertrack/bloc/route_creation/route_creation_events.dart';

import '../dto/route_item_dto.dart';
import '../dto/route_with_points_dto.dart';


Future<PermissionStatus> _getCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    final result = await Permission.camera.request();
    return result;
  } else {
    return status;
  }
}

class QrViewDialog extends StatefulWidget {
  const QrViewDialog({Key? key}) : super(key: key);

  @override
  _QrViewDialogState createState() => _QrViewDialogState();
}

class _QrViewDialogState extends State<QrViewDialog> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    final RouteCreationBloc routeCreationBloc = BlocProvider.of<RouteCreationBloc>(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 200,
      ),
      child: AlertDialog(
        title: const Text('QR CODE SCANNER'),
        content: SizedBox(
          height: 200,
          child: FutureBuilder(
            future: _getCameraPermission(),
            builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || !snapshot.data!.isGranted) {
                return const Text("Error: Don't have the necessary camera permissions");
              }
              return QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController controller) {
                  this.controller = controller;
                  controller.scannedDataStream.listen((scanData) {
                    routeCreationBloc.add(RouteSubstituted(
                        routeItemEntries: RouteWithPoints.fromJson(jsonDecode(scanData.code!))
                            .pointsOfInterest.map(
                                (point) => RouteItemDTO.fromPointsOfInterestEntity(point)
                        ).toList()
                    ));
                    Navigator.of(context).pop();
                  });
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


Future<void> qrCodeScannerBuilder(
    BuildContext context,
    GlobalKey qrKey,
) {

  // data -> jsonString
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: const Text('QR CODE SCANNER'),
          content: FutureBuilder(
            future: _getCameraPermission(),
            builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || !snapshot.data!.isGranted) {
                return const Text("Error: Don't have the necessary camera permissions");
              }
              return QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController controller){
                  controller = qrKey.currentState as QRViewController;
                  controller.resumeCamera();
                  controller.scannedDataStream.listen((scanData) {
                  });
                },
              );
            },
        
        
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}


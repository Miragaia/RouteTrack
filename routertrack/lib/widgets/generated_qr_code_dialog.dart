import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../mycolors/colors.dart';

Future<void> qrCodeDialogBuilder(BuildContext context, String data) {
  // data -> jsonString
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('QR CODE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColorPalette.darkGreen)),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 200,
            maxHeight: 200,
          ),
          child: Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 10.0,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 0, 128, 0),
                width: 0.2,
              ),
              iconColor: Colors.black,
            ),
            child: const Text('Close', style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
        ],
      );
    },
  );
}
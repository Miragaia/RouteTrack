import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<void> qrCodeDialogBuilder(BuildContext context, String data) {
  // data -> jsonString
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('QR CODE'),
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
      );
    },
  );
}
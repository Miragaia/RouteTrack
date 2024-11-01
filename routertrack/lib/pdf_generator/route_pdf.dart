import 'dart:typed_data';
import 'dart:ui';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';

Future<Uint8List> toQrImageData(String data) async {
  try {
    final image = await QrPainter(
      data: data,
      version: QrVersions.auto,
      gapless: false,
    ).toImage(500);
    final a = await image.toByteData(format: ImageByteFormat.png);
    return a!.buffer.asUint8List();
  } catch (e) {
    rethrow;
  }
}

Future<pw.Document> generateRoutePdf({
  required String routeName,
  required String routeData,
}) async {
  Uint8List bytes = await toQrImageData(routeData);
  pw.Document pdf = pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Header(
              level: 0,
              child: pw.Text('Route: $routeName'),
            ),
            pw.SizedBox(height: 20),
            pw.Image(
              pw.MemoryImage(
                bytes,
              ),
            ),
          ]
        ));
      }
  ));
  return pdf;
}
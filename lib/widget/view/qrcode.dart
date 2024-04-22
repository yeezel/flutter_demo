import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../main.dart';

class QrCodeWidget extends StatelessWidget {
  const QrCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      QrImageViewWidget()..init(),
      QrScanWidget()..init(),
    ]);
  }
}
class QrImageViewWidget extends Data{
  @override
  void init() {
    title="QrImageView";
    code = '''
依赖：qr_flutter: ^4.1.0
    
QrImageView(
  data: 'Hello, this is a QR code',
  version: QrVersions.auto,
  size: 200,
)
''';
    ui = QrImageView(
      data: 'Hello, this is a QR code',
      version: QrVersions.auto,
      size: 200,
    );
  }
}
class QrScanWidget extends Data{
  @override
  void init() {
    title="QrScan";
    code = '''
依赖：qr_code_scanner: ^1.0.1
    
''';
    ui = const QRScanView();
  }
}
class QRScanView extends StatefulWidget {
  const QRScanView({super.key});

  @override
  State<QRScanView> createState() => _QRScanViewState();
}
class _QRScanViewState extends State<QRScanView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid || !Platform.isIOS) {
      return const Scaffold(
        body: Text("仅支持Android和IOS平台")
      );
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrPage extends StatefulWidget {
  static const String id = 'ScanQrPage';
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }
  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() => this.controller = controller);
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() => result = scanData);
  //   });
  // }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.resumeCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  // void readQr() async {
  //   if (result != null) {
  //     controller!.pauseCamera();
  //     print(result!.code);
  //     controller!.dispose();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // readQr();
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
          Container(
              height: 100,
              color: Colors.grey.shade900,
              child: Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: (result != null)
                            ? Text(
                                '   Type: ${describeEnum(result!.format)}  \n\n   Data: ${result!.code}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                'Scan a code',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  )))
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
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }


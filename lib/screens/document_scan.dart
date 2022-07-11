import 'dart:io';

import 'package:document_scanner/document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const DocumentScan());

class DocumentScan extends StatefulWidget {
  static const String id = 'DocumentScan';

  const DocumentScan({Key? key}) : super(key: key);
  @override
  _DocumentScanState createState() => _DocumentScanState();
}

class _DocumentScanState extends State<DocumentScan> {
  File? scannedDocument;
  Future<PermissionStatus>? cameraPermissionFuture;

  @override
  void initState() {
    cameraPermissionFuture = Permission.camera.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            title: const Text('Document Scan'),
          ),
          body: FutureBuilder<PermissionStatus>(
            future: cameraPermissionFuture,
            builder: (BuildContext context,
                AsyncSnapshot<PermissionStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.isGranted) {
                  return Container(
                    color: Colors.grey.shade900,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Expanded(
                              child: scannedDocument != null
                                  ? Image(
                                      image: FileImage(scannedDocument!),
                                    )
                                  : DocumentScanner(
                                      noGrayScale: true,
                                      onDocumentScanned:
                                          (ScannedImage scannedImage) {
                                        ("Document : ${scannedImage.croppedImage!}");

                                        setState(() {
                                          scannedDocument = scannedImage
                                              .getScannedDocumentAsFile();
                                        });
                                      },
                                    ),
                            ),
                          ],
                        ),
                        scannedDocument != null
                            ? Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: ElevatedButton(
                                    child: const Text("retry"),
                                    onPressed: () {
                                      setState(() {
                                        scannedDocument = null;
                                      });
                                    }),
                              )
                            : Container(),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Camera permission denied"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}

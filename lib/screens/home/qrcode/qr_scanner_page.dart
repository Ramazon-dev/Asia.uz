import 'dart:io';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(
            child: buildResult(),
            bottom: getHeight(40),
          ),
        ],
      ),
    );
  }

  QRView buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.white,
        ),
      );

  Widget buildResult() => Container(
        alignment: Alignment.center,
        height: getHeight(167),
        width: getWidth(311),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              barcode != null ? "Result: ${barcode!.code}" : "Scan a code!",
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w400,
              ),
            ),
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Закрыть",textColor: AppColors.whiteColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}

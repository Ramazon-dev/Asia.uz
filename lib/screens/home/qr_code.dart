import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreator extends StatefulWidget {
  const QrCodeCreator({Key? key}) : super(key: key);

  @override
  State<QrCodeCreator> createState() => _QrCodeCreatorState();
}

class _QrCodeCreatorState extends State<QrCodeCreator> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "t.me/Ramazon1681",
      size: 400,
    );
  }
}

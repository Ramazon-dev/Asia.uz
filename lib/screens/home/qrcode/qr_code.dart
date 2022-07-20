import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreator extends StatefulWidget {
  double size;
  Color color;
  String text;
  QrCodeCreator({
    this.size = 285,
    this.color = Colors.white,
    required this.text,
    Key? key,
  }) : super(key: key);
  @override
  State<QrCodeCreator> createState() => _QrCodeCreatorState();
}

class _QrCodeCreatorState extends State<QrCodeCreator> {
  @override
  Widget build(BuildContext context) {
    debugPrint("qrCode: ${GetStorage().read("qrcode")}");
    return QrImage(
      data: widget.text,
      size: getHeight(widget.size),
      backgroundColor: widget.color,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreator extends StatefulWidget {
  double size;
  Color color;
  QrCodeCreator({
    this.size = 285,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  State<QrCodeCreator> createState() => _QrCodeCreatorState();
}

class _QrCodeCreatorState extends State<QrCodeCreator> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "t.me/Ramazon1681",
      size: widget.size,
      backgroundColor: widget.color,
    );
  }
}

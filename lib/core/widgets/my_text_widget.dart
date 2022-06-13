import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextWidget extends StatelessWidget {
  MyTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.center,
    // this.fontFamily = ,
  }) : super(key: key);

  String text;
  // String fontFamily;
  Color textColor;
  double fontSize;
  FontWeight fontWeight;
  TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      textAlign: textAlign,
      style: _style(),
      
    );
  }

  _style() {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      // fontFamily: fontFamily,
    );
  }
}

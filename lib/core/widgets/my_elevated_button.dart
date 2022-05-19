import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  Color primaryColor, sideColor, textColor;
  double width, height, radius, sideWidth, textSize;
  FontWeight fontWeight;

  MyElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.primaryColor = Colors.white,
    this.width = 285,
    this.radius = 15,
    this.sideColor = AppColors.unselectedColor,
    this.sideWidth = 2,
    this.textSize = 14,
    this.fontWeight = FontWeight.w600,
    this.textColor = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      autofocus: false,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: getHeight(textSize),
          fontWeight: fontWeight,
          color: textColor,
          
        ),
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.whiteColor,
        elevation: 0,
        primary: primaryColor,
        fixedSize: Size(
          getWidth(width),
          getHeight(height),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: getWidth(sideWidth),
            color: sideColor,
          ),
          borderRadius: BorderRadius.circular(
            getWidth(radius),
          ),
        ),
      ),
    );
  }
}

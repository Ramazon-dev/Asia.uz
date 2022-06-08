import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  debugPrint("screen height $screenHeight");
  // 812 is the layout height that designer use
  double size = SizerUtil.deviceType == DeviceType.mobile ? 812.0 : 1194.0;
  return (inputHeight / size) * screenHeight;
}

// Get the proportionate height as per screen size
double getWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  debugPrint("screen width $screenWidth");
  // 375 is the layout width that designer use
  double size = SizerUtil.deviceType == DeviceType.mobile ? 375.0 : 834.0;
  return (inputWidth / size) * screenWidth;
}

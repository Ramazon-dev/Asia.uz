import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader {
  static loader() {
    return Center(
      child: Platform.isAndroid
          ? Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                fit: BoxFit.cover,
                height: getHeight(70),
              ),
            )
          : Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                fit: BoxFit.cover,
                height: getHeight(70),
              ),
            ),
    );
  }

  static errorData() {
    return const Center(
      child: Text(
        "Ma'lumot yoq",
        style: TextStyle(
          color: AppColors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader {
  static loader() {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator()
          : const CupertinoActivityIndicator(),
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

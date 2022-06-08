import 'dart:async';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/choose_language.dart';
import 'package:asia_uz/screens/view/auth/password_set/return_password.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetStorage().read('firstName') != null
              ? ReturnPassword(text: GetStorage().read("password") ?? "1234")
              : ChooseLanguagePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash_screen.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/enter_phone_number_page.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => EnterPhoneNumberPage())));
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
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

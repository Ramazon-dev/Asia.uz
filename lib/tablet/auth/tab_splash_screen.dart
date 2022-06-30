import 'dart:async';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabSplashScreens extends StatefulWidget {
  const TabSplashScreens({Key? key}) : super(key: key);

  @override
  State<TabSplashScreens> createState() => _TabSplashScreensState();
}

class _TabSplashScreensState extends State<TabSplashScreens> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => GetStorage().read('qrcode') != null
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    TabCheckPassword(
                  text: GetStorage().read("password"),
                ),
              ),
              (route) => false,
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TabChooseLanguagePage(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/splash_screen.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

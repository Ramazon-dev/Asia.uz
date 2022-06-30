import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/splash/check_password.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  // bu page da shunchaki 3 sekund turadi va shu orada agar foydalanuvchi oldin
  //ro'yxatdan otgan bo'lsa asosiy screenga otadi aks xolda registratsiyaga o'tadi
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      // foydalanuvchi oldin ro'yxatdan o'tgan yoki o'tmaganini qrCode orqali 
      // tekshiriladi
      () => GetStorage().read('qrcode') != null
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    CheckPassword(
                  text: GetStorage().read("password"),
                ),
              ),
              (route) => false,
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChooseLanguagePage(),
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
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/enter_phone_number_page.dart';
import 'package:flutter/material.dart';

class ChooseLanguagePage extends StatelessWidget {
  ChooseLanguagePage({Key? key}) : super(key: key);
  bool _onPress1 = false;
  bool _onPress2 = false;
  bool _onPress3 = false;

  OnPressProvider? onPressProvider;

  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: getHeight(150.0)),
            Container(
              height: getHeight(188.0),
              width: getWidth(225.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ).only(bottom: getHeight(56.0)),
            MyTextWidget(
              text: 'Выберите язык'.tr(),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ).only(bottom: getHeight(34.0)),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyElevatedButton(
                      height: 32.0,
                      width: 65.0,
                      radius: 22.0,
                      primaryColor: AppColors.transparentColor,
                      sideColor:
                          _onPress1 ? AppColors.onPressColor : Colors.teal,
                      sideWidth: 2.0,
                      text: "O'ZB",
                      textSize: getHeight(14),
                      onPressed: () {
                        onPressProvider!.onPress();
                        _onPress1 = !_onPress1;
                        _onPress2 = false;
                        _onPress3 = false;
                        // debugPrint("1. $_onPress1 2. $_onPress2 3. $_onPress3");
                        context.setLocale(const Locale('uz', 'UZ'));
                      },
                    ),
                    MyElevatedButton(
                      height: 32.0,
                      width: 65.0,
                      radius: 22.0,
                      primaryColor: AppColors.transparentColor,
                      sideColor:
                          _onPress2 ? AppColors.onPressColor : Colors.teal,
                      sideWidth: 2.0,
                      text: "РУС",
                      textSize: getHeight(14),
                      onPressed: () {
                        onPressProvider!.onPress();
                        _onPress2 = !_onPress2;
                        _onPress1 = false;
                        _onPress3 = false;
                        // debugPrint("1. $_onPress1 2. $_onPress2 3. $_onPress3");

                        context.setLocale(const Locale('ru', 'RU'));
                      },
                    ),
                    MyElevatedButton(
                      height: 32.0,
                      width: 65.0,
                      radius: 22.0,
                      primaryColor: AppColors.transparentColor,
                      sideColor:
                          _onPress3 ? AppColors.onPressColor : Colors.teal,
                      sideWidth: 2.0,
                      text: "ENG",
                      textSize: getHeight(14),
                      onPressed: () {
                        onPressProvider!.onPress();
                        _onPress3 = !_onPress3;
                        _onPress1 = false;
                        _onPress2 = false;
                        context.setLocale(const Locale('en', 'EN'));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getHeight(50.0)),
            MyElevatedButton(
              text: 'Войти'.tr(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterPhoneNumberPage(),
                  ),
                );
              },
              height: 50.0,
              width: 161.0,
              primaryColor: AppColors.transparentColor,
              sideColor: AppColors.onPressColor,
              radius: 15.0,
              sideWidth: 2.0,
            ),
            SizedBox(height: getHeight(140.0)),
            SizedBox(
              height: getHeight(70.0),
              width: getWidth(284.0),
              // color: Colors.amberAccent,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(12.0),
                  ),
                  children: [
                    TextSpan(
                      text:
                          ('Нажимая “Продолжить” вы соглашаетесь с\n условиями '),
                      style: TextStyle(
                        fontSize: getWidth(12.0),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    TextSpan(
                      text: ('Обработки персональных '),
                      style: TextStyle(
                        fontSize: getWidth(12.0),
                        fontWeight: FontWeight.w400,
                        color: AppColors.onPressColor,
                      ),
                    ),
                    TextSpan(
                      text: ('данных и\n'),
                      style: TextStyle(
                        fontSize: getWidth(12.0),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    TextSpan(
                      text: (' Публичной аферты'),
                      style: TextStyle(
                        fontSize: getWidth(12.0),
                        fontWeight: FontWeight.w400,
                        color: AppColors.onPressColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

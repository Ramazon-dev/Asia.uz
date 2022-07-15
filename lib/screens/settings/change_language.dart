import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  int? son;
  bool _onPress1 = false;
  bool _onPress2 = false;
  bool _onPress3 = false;

  List<String> listOfString = ["O'ZB", "РУС", "ENG"];
  @override
  Widget build(BuildContext context) {
    // bu page dan foydalanuvchi language tanlaydi
    return Scaffold(
      appBar: AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getHeight(133.0)),
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
            ),
            const Spacer(),
            Text(
              "Выберите язык".tr(),
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: getHeight(30)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getWidth(40)),
              height: getHeight(40),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyElevatedButton(
                    height: 40,
                    width: 70,
                    radius: 18,
                    primaryColor: AppColors.transparentColor,
                    sideWidth: getWidth(2),
                    text: "O'ZB",
                    sideColor: _onPress1
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    textColor: _onPress1
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    onPressed: () {
                      // onPressProvider!.onPress();
                      context.setLocale(const Locale('uz', 'UZ')).then((value) {
                        setState(() {
                          _onPress1 = true;
                          _onPress2 = false;
                          _onPress3 = false;
                        });
                      });
                      setState(() {});
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(width: getWidth(20)),
                  MyElevatedButton(
                    height: 40,
                    width: 70,
                    radius: 18,
                    primaryColor: AppColors.transparentColor,
                    sideColor: _onPress2
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    textColor: _onPress2
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    sideWidth: getWidth(2),
                    text: "РУС",
                    onPressed: () {
                      // onPressProvider!.onPress();
                      context.setLocale(const Locale('ru', 'RU')).then((value) {
                        setState(() {
                          _onPress2 = true;
                          _onPress1 = false;
                          _onPress3 = false;
                        });
                      });
                      setState(() {});
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(width: getWidth(20)),
                  MyElevatedButton(
                    height: 40,
                    width: 70,
                    radius: 18,
                    primaryColor: AppColors.transparentColor,
                    sideColor: _onPress3
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    textColor: _onPress3
                        ? AppColors.orangeColor
                        : AppColors.unselectedColor,
                    sideWidth: getHeight(2),
                    text: "ENG",
                    onPressed: () {
                      // onPressProvider!.onPress();
                      context.setLocale(const Locale('en', 'EN')).then((value) {
                        setState(() {
                          _onPress3 = true;
                          _onPress1 = false;
                          _onPress2 = false;
                        });
                      });
                      setState(() {});
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(50.0)),
            MyElevatedButton(
              text: 'Войти'.tr(),
              textSize: getWidth(16),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                  (route) => false,
                );
                // Navigator.pop(context);
              },
              height: getHeight(50),
              width: getWidth(161),
              textColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              sideColor: AppColors.orangeColor,
              radius: getHeight(15),
              sideWidth: getWidth(2),
            ),
            const Spacer(),
            RichTextWidget(),
          ],
        ),
      ),
    );
  }
}

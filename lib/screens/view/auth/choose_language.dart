import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/enter_phone_number_page.dart';
import 'package:flutter/material.dart';

class ChooseLanguagePage extends StatefulWidget {
  ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  int? son;

  List<String> listOfString = ["O'ZB", "РУС", "ENG"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
          ),
        ),
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
              height: getHeight(50),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(30.0)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MyElevatedButton(
                        height: 32.0,
                        width: 80.0,
                        radius: 22.0,
                        primaryColor: AppColors.transparentColor,
                        textColor:
                            son == index ? AppColors.orangeColor : Colors.teal,
                        sideColor: son == index
                            ? AppColors.orangeColor
                            : AppColors.unselectedColor,
                        sideWidth: 2.0,
                        text: listOfString[index],
                        textSize: getHeight(14),
                        onPressed: () {
                          son = index;
                          if (son == 0) {
                            context.setLocale(const Locale('uz', 'UZ'));
                          } else if (son == 1) {
                            context.setLocale(const Locale('ru', 'RU'));
                          } else if (son == 2) {
                            context.setLocale(const Locale('en', 'EN'));
                          }
                          setState(() {});
                        },
                      ).only(right: getWidth(20)),
                    );
                  },
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
              textColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              sideColor: AppColors.orangeColor,
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

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
    // SizeConfig().init(context);
    return Scaffold(
      body: Container(
        // width: getWidth(),
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
            // MyTextWidget(
            //   text: 'Выберите язык'.tr(),
            //   fontSize: SizerUtil.deviceType == DeviceType.mobile
            //       ? getHeight(16)
            //       : getHeight(36),
            //   fontWeight: FontWeight.w500,
            // ).only(bottom: getHeight(34.0)),
            Container(
              height: getHeight(40),
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 1 / 7,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: MyElevatedButton(
                        height: 40,
                        width: 70,
                        radius: 18,
                        primaryColor: AppColors.transparentColor,
                        textColor: son == index
                            ? AppColors.orangeColor
                            : AppColors.unselectedColor,
                        sideColor: son == index
                            ? AppColors.orangeColor
                            : AppColors.unselectedColor,
                        sideWidth: getWidth(2),
                        text: listOfString[index],
                        fontWeight: FontWeight.w700,
                        textSize: 15,
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
              textSize: getWidth(16),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterPhoneNumberPage(),
                  ),
                );
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
            // SizedBox(height: getHeight(116.0)),
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
                        color: AppColors.orangeColor,
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
                        color: AppColors.orangeColor,
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

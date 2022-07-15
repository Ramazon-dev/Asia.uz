import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabChangeLanguagePage extends StatefulWidget {
  const TabChangeLanguagePage({Key? key}) : super(key: key);

  @override
  State<TabChangeLanguagePage> createState() => _TabChangeLanguagePageState();
}

class _TabChangeLanguagePageState extends State<TabChangeLanguagePage> {
  int? son;

  List<String> listOfString = ["O'ZB", "РУС", "ENG"];
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            SizedBox(height: getHeight(140.0)),
            Container(
              height: getHeight(330.0),
              width: getWidth(425.0),
              decoration: const BoxDecoration(
                // color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: getHeight(120)),
            Text(
              "Выберите язык".tr(),
              style: TextStyle(
                fontSize: getHeight(32),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              height: getHeight(55),
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 1 / 4,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: MyElevatedButton(
                        height: 55,
                        width: 115,
                        radius: 30,
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
                        textSize: 29,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabMainPage(),
                            ),
                          );
                          son = index;
                          if (son == 0) {
                            context.setLocale(const Locale('uz', 'UZ'));
                            setState(() {});
                          } else if (son == 1) {
                            context.setLocale(const Locale('ru', 'RU'));
                            setState(() {});
                          } else if (son == 2) {
                            context.setLocale(const Locale('en', 'EN'));
                            setState(() {});
                          }
                          setState(() {});
                        },
                      ).only(right: getWidth(30)),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: getHeight(67.0)),
            MyElevatedButton(
              text: 'Войти'.tr(),
              textSize: getWidth(30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabMainPage(),
                  ),
                );
              },
              height: 94,
              width: 303,
              textColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              sideColor: AppColors.orangeColor,
              radius: getHeight(30),
              sideWidth: getWidth(2),
            ),
            const Spacer(),
            RichTextWidget(
              textsize: 16,
              width: 400,
            ),
            SizedBox(height: getHeight(60)),
          ],
        ),
      ),
    );
  }
}

import 'package:asia_uz/screens/about_us/about_us_page.dart';
import 'package:asia_uz/screens/pages/news_page.dart';
import 'package:asia_uz/screens/profile/profile_page.dart';
import 'package:asia_uz/screens/view/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key, required this.model}) : super(key: key);

  bool _onPress1 = false;
  bool _onPress2 = false;
  bool _onPress3 = false;

  OnPressProvider? onPressProvider;

  BottomNavigationBarProvider? model;

  @override
  Widget build(BuildContext context) {
    onPressProvider = context.read<OnPressProvider>();

    var _context = context.watch<BottomNavigationBarProvider>();

    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(
          getWidth(20.0),
        ),
        bottomRight: Radius.circular(
          getWidth(20.0),
        ),
      ),
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: getHeight(65.0)),
              Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.7,
                width: getWidth(171.0),
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: getHeight(0.0),
                  ),
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    navigations(int i) {
                      switch (i) {
                        case 0:
                          Navigator.pop(context);
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewsPage()));
                          break;
                        case 2:
                          _context.currentTab = 1;
                          Navigator.pop(context);
                          break;
                        case 3:
                          _context.currentTab = 2;
                          Navigator.pop(context);
                          break;
                        case 4:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                          break;
                        case 5:
                          _context.currentTab = 3;
                          Navigator.pop(context);
                          break;
                        case 6:
                          debugPrint("bosildi : 6 kontakti ");
                          break;
                        case 7:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsPage()));
                          break;
                        case 8:
                          GetStorage().remove('telNumber');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SplashScreens()));
                          break;
                      }
                    }

                    return GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getHeight(20.0),
                        ),
                        child: MyTextWidget(
                          textAlign: TextAlign.left,
                          text: titles[index],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white,
                        ),
                      ),
                      onTap: () {
                        navigations(index);
                        // Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getHeight(50)),
                height: getHeight(76),
                width: getWidth(300),
                color: const Color(0xff800D0D0D),
                child: Column(
                  children: [
                    SizedBox(
                      height: getHeight(20.0),
                      child: Align(
                        child: MyTextWidget(
                          text: 'Выберите язык'.tr(),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(10.0)),
                    languages(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  languages(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyElevatedButton(
            height: 32.0,
            width: 65.0,
            radius: 22.0,
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress1 ? AppColors.onPressColor : Colors.white,
            sideWidth: 2.0,
            text: "O'ZB",
            textColor: AppColors.whiteColor,
            onPressed: () {
              // onPressProvider!.onPress();
              _onPress1 = !_onPress1;
              _onPress2 = false;
              _onPress3 = false;
              context.setLocale(const Locale('uz', 'UZ'));
            },
          ),
          MyElevatedButton(
            height: 32.0,
            textColor: AppColors.whiteColor,
            width: 65.0,
            radius: 22.0,
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress2 ? AppColors.onPressColor : Colors.white,
            sideWidth: 2.0,
            text: "РУС",
            onPressed: () {
              // onPressProvider!.onPress();
              _onPress2 = !_onPress2;
              _onPress1 = false;
              _onPress3 = false;
              context.setLocale(const Locale('ru', 'RU'));
            },
          ),
          MyElevatedButton(
            height: 32.0,
            textColor: AppColors.whiteColor,
            width: 65.0,
            radius: 22.0,
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress3 ? AppColors.onPressColor : Colors.white,
            sideWidth: 2.0,
            text: "ENG",
            onPressed: () {
              // onPressProvider!.onPress();
              _onPress3 = !_onPress3;
              _onPress1 = false;
              _onPress2 = false;
              context.setLocale(const Locale('en', 'EN'));
            },
          ),
        ],
      ),
    );
  }

  List<String> titles = [
    'Главная',
    'Новости и акции',
    'Карта лояльности',
    'Отзывы',
    'Профиль',
    'Карта',
    'Контакты',
    'О нас',
    'Выйти',
  ];
}

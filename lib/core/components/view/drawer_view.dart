import 'package:asia_uz/screens/about_us/about_us_page.dart';
import 'package:asia_uz/screens/pages/news_page.dart';
import 'package:asia_uz/screens/profile/profile_page.dart';
import 'package:asia_uz/screens/view/auth/splash/splash_screens.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: getHeight(58.0)),
                Padding(
                  padding: EdgeInsets.only(left: getHeight(20)),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        SvgIcons.menu,
                        height: getHeight(28),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: getHeight(25)),
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
                            _context.currentTab = 0;
                            Navigator.pop(context);
                            break;
                          case 1:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewsPage()));
                            break;
                          case 2:
                            _context.currentTab = 3;
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
                            _context.currentTab = 1;
                            Navigator.pop(context);
                            break;
                          case 6:
                            debugPrint("bosildi : 6 kontakti ");
                            break;
                          case 7:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUsPage()));
                            break;
                          case 8:
                            GetStorage().remove('telNumber');
                            GetStorage().remove('token');
                            GetStorage().remove('firstName');
                            //! GetStorage().remove("qrcode");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SplashScreens()));
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
                            fontSize: getHeight(18),
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
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(getHeight(5)),
                  margin: EdgeInsets.only(top: getHeight(20)),
                  height: getHeight(105),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff800D0D0D),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextWidget(
                        text: 'Выберите язык'.tr(),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.white,
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
            height: getHeight(32),
            width: getWidth(55),
            radius: getHeight(22),
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress1 ? AppColors.onPressColor : Colors.white,
            sideWidth: getWidth(2),
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
            height: getHeight(32),
            width: getWidth(65),
            radius: getHeight(22),
            textColor: AppColors.whiteColor,
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress2 ? AppColors.onPressColor : Colors.white,
            sideWidth: getWidth(2),
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
            height: getHeight(32),
            textColor: AppColors.whiteColor,
            width: getWidth(65),
            radius: getHeight(22),
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress3 ? AppColors.onPressColor : Colors.white,
            sideWidth: getHeight(2),
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

import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MyDrawer extends StatelessWidget {
  BottomNavigationBarProvider? model;
  MyDrawer({Key? key, required this.model}) : super(key: key);

  bool _onPress1 = false;
  bool _onPress2 = false;
  bool _onPress3 = false;

  OnPressProvider? onPressProvider;

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
                'assets/images/newbg.png',
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      SvgIcons.menu,
                      height: getHeight(25),
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  padding: EdgeInsets.only(top: getHeight(25)),
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: getWidth(200.0),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: getHeight(0.0),
                    ),
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      navigations(int i) async {
                        switch (i) {
                          case 0:
                            _context.currentTab = 0;
                            _context.tabcurrentTab = 0;
                            Navigator.pop(context);
                            break;
                          case 1:
                            bool hasInternet =
                                await InternetConnectionChecker().hasConnection;
                            debugPrint("has internet: $hasInternet");
                            if (hasInternet) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewsPage(),
                                ),
                              );
                            } else {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NoConnectionPage(),
                                ),
                                (route) => false,
                              );
                            }

                            break;
                          case 2:
                            _context.currentTab = 3;
                            _context.tabcurrentTab = 3;

                            Navigator.pop(context);
                            break;
                          case 3:
                            _context.currentTab = 2;
                            _context.tabcurrentTab = 2;
                            Navigator.pop(context);
                            break;
                          case 4:
                            _context.currentTab = 1;
                            _context.tabcurrentTab = 1;
                            Navigator.pop(context);
                            break;
                          case 5:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Contacts(model: model),
                              ),
                            );
                            debugPrint("bosildi : 6 kontakti ");
                            break;
                          case 6:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutUsPage()));
                            break;
                          case 7:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsChooseLayout()));
                            debugPrint("bosildi : 8 settings ");
                            break;
                          case 8:
                            showAlertDialogMethod(context);
                            break;
                        }
                      }

                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getHeight(17.0),
                          ),
                          child: MyTextWidget(
                            textAlign: TextAlign.left,
                            text: titles[index].tr(),
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
      // color: Colors.yellow,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyElevatedButton(
            height: 32,
            width: 68,
            radius: 22,
            primaryColor: AppColors.transparentColor,
            sideColor: _onPress1 ? AppColors.onPressColor : Colors.white,
            sideWidth: 2,
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
            height: 32,
            width: 63,
            radius: 22,
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
            height: 32,
            textColor: AppColors.whiteColor,
            width: 63,
            radius: 22,
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
    'Карта',
    'Контакты',
    'О нас',
    "Настройки",
    'Выйти',
  ];
  showAlertDialogMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Chiqishni xoxlaysizmi",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(40),
              width: getWidth(100),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "cancel",
              textColor: AppColors.whiteColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MyElevatedButton(
              height: getHeight(40),
              width: getWidth(100),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "exit",
              textColor: AppColors.whiteColor,
              onPressed: () {
                GetStorage().remove('telNumber');
                GetStorage().remove('token');
                GetStorage().remove('firstName');
                GetStorage().remove("barcode");
                GetStorage().remove("qrcode");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

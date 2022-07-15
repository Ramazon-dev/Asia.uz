import 'package:asia_uz/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MainPage extends StatelessWidget {
  // int? index;
  MainPage({Key? key}) : super(key: key);

  bool closeDrawer = true;

  bool first = true;
  final GlobalKey<ScaffoldState> _scaoffoldKey = GlobalKey();
  OnPressProvider? onPressProvider;

  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    SizeConfig().init(context);
// bu page main page xisoblanib
// bottomnavbar appbar va drawer widgetlari shu joyda ishlatilgan
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (context) => BottomNavigationBarProvider(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, model, child) => Scaffold(
          extendBodyBehindAppBar: true,
          onDrawerChanged: (valueDrawer) {
            if (_scaoffoldKey.currentState!.isDrawerOpen == true) {
              closeDrawer = true;
            } else {
              closeDrawer = false;
            }
          },
          backgroundColor: AppColors.unselectedColor,
          key: _scaoffoldKey,
          appBar: MyAppBar(
            leading: InkWell(
              onTap: () {
                _scaoffoldKey.currentState!.openDrawer();
                _scaoffoldKey.currentState!.isDrawerOpen;
              },
              child: Padding(
                padding:
                    EdgeInsets.only(left: getWidth(20), top: getHeight(10)),
                child: SvgPicture.asset(
                  SvgIcons.menu,
                  height: getHeight(20),
                  color: AppColors.black,
                ),
              ),
            ),
            text: titlesOfAppBar[model.currentTab].toString(),
            action: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              child: Icon(
                Icons.info_outline_rounded,
                color: AppColors.whiteColor,
                size: getHeight(30),
              ),
            ).only(right: getWidth(10), top: getHeight(10)),
          ),
          drawer: MyDrawer(model: model),
          body: model.currentScreens,
          bottomNavigationBar: Container(
              color: const Color(0xffF29443),
              padding: EdgeInsets.only(top: getHeight(3)),
              child: MyBottomNavigationBar(model: model)),
        ),
      ),
    );
  }

  List<String> titlesOfAppBar = [
    'Главная'.tr(),
    'Магазин'.tr(),
    'Отзывы'.tr(),
    'Карты'.tr(),
  ];
}

import 'package:asia_uz/tablet/main/tab_myappbar.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabMainPage extends StatelessWidget {
  // int? index;
  TabMainPage({Key? key}) : super(key: key);

  bool closeDrawer = true;

  bool first = true;
  OnPressProvider? onPressProvider;
  final GlobalKey<ScaffoldState> _scaoffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    SizeConfig().init(context);

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
          appBar: TabMyAppBar(
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
                  height: getHeight(28),
                  color: AppColors.black,
                ),
              ),
            ),
            textSize: 36,
            text: titlesOfAppBar[model.tabcurrentTab].toString().tr(),
            action: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabSettingsPage(),
                  ),
                );
              },
              child: Icon(
                Icons.info_outline,
                color: AppColors.whiteColor,
                size: getHeight(50),
              ),
            ).only(right: getWidth(10), top: getHeight(10)),
          ),
          drawer: MyDrawer(model: model),
          body: model.tabCurrentScreens,
          bottomNavigationBar: Container(
            color: const Color(0xffF29443),
            padding: EdgeInsets.only(top: getHeight(3)),
            child: TabMyBottomNavigationBar(model: model),
          ),
        ),
      ),
    );
  }

  List<String> titlesOfAppBar = [
    'Главная',
    'Магазин',
    'Отзывы',
    'Карты',
  ];
}

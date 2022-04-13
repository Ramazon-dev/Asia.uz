import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:asia_uz/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  bool closeDrawer = true;

  OnPressProvider? onPressProvider;

  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    SizeConfig().init(context);
    GlobalKey<ScaffoldState> _scaoffoldKey = GlobalKey();

    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (context) => BottomNavigationBarProvider(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, model, child) => Scaffold(
          onDrawerChanged: (valueDrawer) {
            debugPrint("ffffff : $valueDrawer");

            if (_scaoffoldKey.currentState!.isDrawerOpen == true) {
              closeDrawer = true;
            } else {
              closeDrawer = false;
            }

            debugPrint("drawer : $closeDrawer");

            debugPrint(
                "is open drawer : ${_scaoffoldKey.currentState!.isDrawerOpen}");
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
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgIcons.menu),
              ),
            ),
            text: titlesOfAppBar[model.currentTab].toString(),
            action: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: SvgPicture.asset(SvgIcons.avatar)),
          ),
          drawer: MyDrawer(),
          body: model.currentScreens,
          bottomNavigationBar: MyBottomNavigationBar(
            model: model,
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

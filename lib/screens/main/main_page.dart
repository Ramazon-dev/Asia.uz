import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaoffoldKey = GlobalKey();

    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (context) => BottomNavigationBarProvider(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColors.unselectedColor,
          key: _scaoffoldKey,
          appBar: MyAppBar(
            text: titlesOfAppBar[model.currentTab].toString(),
            onTab: () {
              _scaoffoldKey.currentState!.openDrawer();
            },
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
    'Карты',
    'Отзывы',
    'Новости и акции',
  ];
}

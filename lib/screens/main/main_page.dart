import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:asia_uz/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  bool isOpenDrawer = true;

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
          onDrawerChanged: (valueDrawer){
            debugPrint("ffffff : $valueDrawer");
            // onPressProvider!.onPress();

            if(valueDrawer == true){
              isOpenDrawer = true;
            } else {
              isOpenDrawer = false;
            }
            debugPrint("rrrr : $isOpenDrawer");



          },
          backgroundColor: AppColors.unselectedColor,
          key: _scaoffoldKey,
          appBar: MyAppBar(
            widget: SvgPicture.asset(SvgIcons.menu),
            text: titlesOfAppBar[model.currentTab].toString(),
            onTab: () {
              _scaoffoldKey.currentState!.openDrawer();

            },
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            icon: SvgPicture.asset(SvgIcons.avatar),
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

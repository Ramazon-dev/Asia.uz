import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaoffoldKey = GlobalKey();

    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (context) => BottomNavigationBarProvider(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColors.unselectedColor,
          key: _scaoffoldKey,
          appBar: AppBar(
            backgroundColor: AppColors.unselectedColor,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(SvgIcons.menu),
              onPressed: () {
                _scaoffoldKey.currentState!.openDrawer();
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  SvgIcons.avatar,
                ),
              ),
            ],
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
}

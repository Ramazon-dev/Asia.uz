import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({Key? key, required this.model}) : super(key: key);

  BottomNavigationBarProvider model;

  @override
  Widget build(BuildContext context) {
    var _context = context.watch<BottomNavigationBarProvider>();
    SizeConfig().init(context);
    return BottomNavigationBar(
      unselectedItemColor: AppColors.unselectedColor,
      selectedItemColor: AppColors.unselectedColor,
      backgroundColor: AppColors.bottomNavigationBgColor,
      items: [
        BottomNavigationBarItem(
          label: 'Главная',
          icon: _context.currentTab == 0
              ? SvgPicture.asset(SvgIcons.home, color: AppColors.orangeColor,)
              : SvgPicture.asset(SvgIcons.home,),
        ),
        BottomNavigationBarItem(
          label: 'Магазины',
          icon: _context.currentTab == 1
              ? SvgPicture.asset(SvgIcons.shops, color: AppColors.orangeColor,)
              : SvgPicture.asset(SvgIcons.shops),
        ),
        BottomNavigationBarItem(
          label: 'Отзывы',
          icon: _context.currentTab == 2
              ? SvgPicture.asset(SvgIcons.review, color: AppColors.orangeColor,)
              : SvgPicture.asset(SvgIcons.review),
        ),
        BottomNavigationBarItem(
          label: 'Карты',
          icon: _context.currentTab == 3
              ? SvgPicture.asset(SvgIcons.karti, color: AppColors.orangeColor,)
              : SvgPicture.asset(SvgIcons.karti),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _context.currentTab,
      onTap: (int idx) {
        model.currentTab = idx;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatelessWidget {
  int? index;
  MyBottomNavigationBar({Key? key, required this.model, this.index})
      : super(key: key);

  BottomNavigationBarProvider model;

  bool first = true;

  @override
  Widget build(BuildContext context) {
    var _context = context.watch<BottomNavigationBarProvider>();
    SizeConfig().init(context);
    return BottomNavigationBar(
      unselectedItemColor: AppColors.bottomUnselectedColor,
      selectedItemColor: AppColors.bottomUnselectedColor,
      backgroundColor: AppColors.bottomNavigationBgColor,
      items: [
        BottomNavigationBarItem(
          label: 'Главная',
          icon: _context.currentTab == 0
              ? SvgPicture.asset(
                  SvgIcons.home,
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.home,
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Магазины',
          icon: _context.currentTab == 1
              ? SvgPicture.asset(
                  SvgIcons.shops,
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.shops,
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Отзывы',
          icon: _context.currentTab == 2
              ? SvgPicture.asset(
                  SvgIcons.review,
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.review,
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Карты',
          icon: _context.currentTab == 3
              ? SvgPicture.asset(
                  SvgIcons.karti,
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.karti,
                  color: AppColors.bottomUnselectedColor,
                ),
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

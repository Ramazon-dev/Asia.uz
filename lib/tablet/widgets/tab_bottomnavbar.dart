import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

// ignore: must_be_immutable
class TabMyBottomNavigationBar extends StatelessWidget {
  int? index;
  TabMyBottomNavigationBar({Key? key, required this.model, this.index})
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
      selectedLabelStyle: TextStyle(
        fontSize: getHeight(20),
        color: AppColors.orange,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: getHeight(20),
        color: AppColors.bottomUnselectedColor,
        fontWeight: FontWeight.w700,
      ),
      items: [
        BottomNavigationBarItem(
          label: 'Главная'.tr(),
          icon: _context.tabcurrentTab == 0
              ? SvgPicture.asset(
                  SvgIcons.home,
                  height: getHeight(43),
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.home,
                  height: getHeight(43),
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Магазины'.tr(),
          icon: _context.tabcurrentTab == 1
              ? SvgPicture.asset(
                  SvgIcons.shops,
                  height: getHeight(43),
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.shops,
                  height: getHeight(43),
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Отзывы'.tr(),
          icon: _context.tabcurrentTab == 2
              ? SvgPicture.asset(
                  SvgIcons.review,
                  height: getHeight(43),
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.review,
                  height: getHeight(43),
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
        BottomNavigationBarItem(
          label: 'Карты'.tr(),
          icon: _context.tabcurrentTab == 3
              ? SvgPicture.asset(
                  SvgIcons.karti,
                  height: getHeight(43),
                  color: AppColors.orangeColor,
                )
              : SvgPicture.asset(
                  SvgIcons.karti,
                  height: getHeight(43),
                  color: AppColors.bottomUnselectedColor,
                ),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _context.tabcurrentTab,
      onTap: (int idx) {
        model.tabcurrentTab = idx;
      },
    );
  }
}

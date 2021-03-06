import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  double appbarHeihgt;
  double iconSize;
  Color iconColor;
  AppBarWidget({
    Key? key,
    this.appbarHeihgt = 100,
    this.iconSize = 15,
    this.iconColor = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(
          "assets/icons/arrow_back.png",
          color: iconColor,
          height: getHeight(iconSize),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor),
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(getWidth(375), getHeight(appbarHeihgt));
}

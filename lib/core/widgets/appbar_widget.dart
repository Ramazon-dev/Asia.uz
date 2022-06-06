import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(
          "assets/icons/arrow_back.png",
          color: AppColors.black,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(getWidth(375), getHeight(100));
}

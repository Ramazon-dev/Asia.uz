import 'package:flutter/material.dart';
import '../../imports/imports.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({Key? key, this.text, this.onTab}) : super(key: key);

  String? text;
  VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: AppColors.orangeColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            getWidth(15.0),
          ),
          bottomRight: Radius.circular(
            getWidth(15.0),
          ),
        ),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(SvgIcons.menu),
        onPressed: onTab,
      ),
      title: Container(
        alignment: Alignment.center,
        width: getWidth(300.0),
        child: Text(
          text!,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: getWidth(20.0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            debugPrint("on tab");
          },
          icon: SvgPicture.asset(
            SvgIcons.avatar,
            // color: AppColors.unselectedColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        getWidth(327.0),
        getHeight(80.0),
      );
}
import 'package:flutter/material.dart';
import '../../imports/imports.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key? key,
    this.text,
    // this.onTab,
    this.leading,
    // this.onPress,
    this.action,
  }) : super(key: key);

  String? text;
  // VoidCallback? onTab, onPress;
  Widget? leading, action;

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
      leading: leading ?? Container(),
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
        action ?? Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        getWidth(327.0),
        getHeight(80.0),
      );
}

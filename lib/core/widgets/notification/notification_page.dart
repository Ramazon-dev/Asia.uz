import 'package:asia_uz/core/imports/imports.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }

  flash(context, message, color) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 5),
      builder: (_, controller) {
        return Flash(
          backgroundColor: color,
          controller: controller,
          position: FlashPosition.top,
          behavior: FlashBehavior.floating,
          borderRadius: BorderRadius.circular(getWidth(20)),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top + getHeight(10),
              horizontal: getWidth(50)),
          child: FlashBar(
            content: Center(
              child: MyTextWidget(
                text: message,
                textColor: AppColors.whiteColor,
                fontSize: getWidth(16.0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}

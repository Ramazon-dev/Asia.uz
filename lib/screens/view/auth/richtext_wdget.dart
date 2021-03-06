import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  double textsize;
  double height;
  double width;
  RichTextWidget({
    Key? key,
    this.textsize = 12,
    this.height = 70,
    this.width = 284,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(height),
      width: getWidth(width),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: AppColors.black,
            fontSize: getWidth(12.0),
          ),
          children: [
            TextSpan(
              text: ('Нажимая “Продолжить” вы соглашаетесь с\n условиями'.tr()),
              style: TextStyle(
                fontSize: getWidth(textsize),
                fontWeight: FontWeight.w400,
                color: AppColors.bottomUnselectedColor,
              ),
            ),
            TextSpan(
              text: ('Обработки персональных'.tr()),
              style: TextStyle(
                fontSize: getWidth(textsize),
                fontWeight: FontWeight.w400,
                color: AppColors.orangeColor,
              ),
            ),
            TextSpan(
              text: ('данных и\n'.tr()),
              style: TextStyle(
                  fontSize: getWidth(textsize),
                  fontWeight: FontWeight.w400,
                  color: AppColors.bottomUnselectedColor),
            ),
            TextSpan(
              text: (' Публичной аферты'.tr()),
              style: TextStyle(
                fontSize: getWidth(textsize),
                fontWeight: FontWeight.w400,
                color: AppColors.orangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

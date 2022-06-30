import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabHistoryPage extends StatelessWidget {
  TabHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      height: getHeight(200.0),
      width: double.infinity,
      margin: EdgeInsets.only(
        top: getHeight(30.0),
      ),
      child: SizedBox(
        width: getWidth(450),
        child: Column(
          children: [
            SizedBox(height: getHeight(170.0)),
            Text(
              'История отзывов пуста.'.tr(),
              style: TextStyle(
                color: AppColors.black,
                fontSize: getWidth(32.0),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(25)),
            Text(
              'Вы можете оставить свой отзыв, перейдя в раздел “ Новый отзыв”'
                  .tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: getWidth(24.0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

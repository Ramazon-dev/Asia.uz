import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      height: getHeight(200.0),
      width: double.infinity,
      padding: EdgeInsets.all(getHeight(30)),
      margin: EdgeInsets.only(
        top: getHeight(30.0),
      ),
      child: Column(
        children: [
          SizedBox(height: getHeight(170.0)),
          Text(
            'История отзывов пуста.'.tr(),
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(20.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(18)),
          Text(
            'Вы можете оставить свой отзыв, перейдя в раздел “ Новый отзыв”.'
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.teal,
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

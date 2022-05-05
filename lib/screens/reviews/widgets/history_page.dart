import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

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
      child: Column(
        children: [
          SizedBox(height: getHeight(170.0)),
          Text(
            'История отзывов пуста.',
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(20.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Вы можете оставить свой отзыв, перейдя в раздел “ Новый отзыв”',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

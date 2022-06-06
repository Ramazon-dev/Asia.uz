import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

import '../../core/components/view/my_app_bar.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        text: 'События',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/arrow_back.png",
            color: AppColors.whiteColor,
          ),
        ),
        action: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(10.0),
          vertical: getHeight(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(getWidth(15.0)),
          child: Container(
            height: getHeight(586.0),
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Column(
              children: [
                SizedBox(height: getHeight(20.0)),
                Text(
                  '22 февраля самые низкиецены\nна манго и авакадо!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(16.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: getHeight(257.0),
                  width: getWidth(331.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getWidth(15.0),
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/news.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).symmetric(
                    horizontal: getWidth(10.0), vertical: getHeight(20.0)),
                Text(
                  'Встречайте шестой электронный\nкаталог от Asia.uz! Наш каталог\nпредставляет собой сборник лучших\nскидок и весенних предложений.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(16.0),
                  ),
                ),
                SizedBox(height: getHeight(20.0)),
                Text(
                  'Действует с 18 по 31 марта.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(16.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: getHeight(20.0)),
                Text(
                  'Делайте выгодные покупки вместе с\nнами!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(16.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

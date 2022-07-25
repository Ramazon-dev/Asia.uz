import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  String id;
  String title;
  String image;
  String discription;
  String created;
  NewsDetailPage({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.discription,
    required this.created,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 600
          ? buildMobile(context)
          : buildTab(context);
    });
  }

  Scaffold buildMobile(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        text: 'События'.tr(),
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
                  title,
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
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).symmetric(
                    horizontal: getWidth(10.0), vertical: getHeight(10.0)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    // '22 февраля самые низкие цены\nна манго и авакадо!',
                    created,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.teal,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  ),
                ).only(right: getWidth(15), bottom: getHeight(5)),
                Text(
                  // 'Встречайте шестой электронный\nкаталог от Asia.uz! Наш каталог\nпредставляет собой сборник лучших\nскидок и весенних предложений.',
                  discription,
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

  Scaffold buildTab(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        textSize: 32,
        text: 'Новости и акции'.tr(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            height: getHeight(20),
            width: getWidth(30),
          ),
        ),
        action: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(30.0),
          vertical: getHeight(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(getWidth(15.0)),
          child: Container(
            height: getHeight(1028.0),
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Column(
              children: [
                SizedBox(height: getHeight(32.0)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(32.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: getHeight(522.0),
                  width: getWidth(674.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getWidth(20.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).symmetric(
                    horizontal: getWidth(10.0), vertical: getHeight(20.0)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    // '22 февраля самые низкие цены\nна манго и авакадо!',
                    created,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.teal,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(24.0),
                    ),
                  ),
                ).only(right: getWidth(15), bottom: getHeight(5)),
                Text(
                  // 'Встречайте шестой электронный\nкаталог от Asia.uz! Наш каталог\nпредставляет собой сборник лучших\nскидок и весенних предложений.',
                  discription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(32.0),
                  ),
                ),
                SizedBox(height: getHeight(20.0)),
                Text(
                  'Действует с 18 по 31 марта.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(32.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: getHeight(20.0)),
                Text(
                  'Делайте выгодные покупки вместе с\nнами!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(32.0),
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

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/qrcode/qr_code.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      // backgroundColor: Colors.cyanAccent,
      body: Column(
        children: [
          Container(
            height: getHeight(540),
            // margin: EdgeInsets.only(top: getHeight(114)),
            padding: EdgeInsets.only(top: getHeight(135)),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: MyTextWidget(
                    text: 'Покажите QR-код  кассиру',
                    fontSize: 19.0,
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  width: double.infinity,
                  height: 20.0,
                ),
                SizedBox(height: getHeight(20.0)),
                QrCodeCreator(size: getHeight(280)),
                SizedBox(height: getHeight(20.0)),
                cashback(),
                SizedBox(height: getHeight(18.0)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: getHeight(20)),
            margin: EdgeInsets.only(top: getHeight(25)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getHeight(10)),
                topRight: Radius.circular(getHeight(10)),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextWidget(
                        text: 'События',
                        textAlign: TextAlign.left,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.black,
                      ),
                      MyTextWidget(
                        text: 'Все',
                        textAlign: TextAlign.right,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.textButton,
                      ),
                    ],
                  ),
                ),
                information(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  cashback() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'На счету',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getWidth(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              MyTextWidget(
                textAlign: TextAlign.right,
                text: 'Расход за месяц',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: getWidth(4.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextWidget(
                text: '0 баллов',
                textAlign: TextAlign.left,
                textColor: AppColors.orange,
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
              ),
              MyTextWidget(
                text: '0 баллов',
                textAlign: TextAlign.right,
                textColor: AppColors.teal,
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  information(BuildContext context) {
    return SizedBox(
      height: getHeight(150),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(10.0),
              vertical: getHeight(10.0),
            ),
            child: Container(
              height: getHeight(120.0),
              width: getWidth(228.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getWidth(15.0),
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/i.png',
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

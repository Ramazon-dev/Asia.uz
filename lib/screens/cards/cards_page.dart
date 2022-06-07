import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/cards/widgets/card_widget.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:asia_uz/screens/no_internet/no_connection.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: getHeight(120)),
            height: getHeight(515.0),
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Column(
              children: [
                SizedBox(height: getHeight(10.0)),
                Text(
                  'Добро пожаловать в систему\nлояльности',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: getWidth(20.0),
                  ),
                ),
                SizedBox(height: getHeight(30.0)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NoConnectionPage(),
                        ),
                      );
                    },
                    child: const CardWidget()),
                SizedBox(height: getHeight(20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Баланс:',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2 000.00',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ).symmetric(horizontal: getWidth(24.0)),
                SizedBox(height: getHeight(25.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Бонусы за покупку:',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '300.00',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ).symmetric(horizontal: getWidth(24.0)),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(getWidth(15.0)),
            padding: EdgeInsets.all(getWidth(10)),
            height: getHeight(160.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(getWidth(15.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QRCodeScannerPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(getHeight(15))),
                    primary: Colors.orange.shade300,
                    fixedSize: Size(getWidth(320), getHeight(69)),
                  ),

                  // child: Container(
                  // margin: EdgeInsets.all(getWidth(14.0)),
                  // height: getHeight(69.0),
                  // width: double.infinity,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(
                  //     getWidth(15.0),
                  //   ),
                  //   color: Colors.orange.shade300,
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_circle, color: AppColors.whiteColor),
                      SizedBox(width: getWidth(5.0)),
                      Text(
                        'Добавить имеющуюся карту',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: getWidth(16.0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: getHeight(10)),
                // ),
                Text(
                  'Вы можете добавить физическую карту лояльности отсканировав штрих-код',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(14.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // SizedBox(height: getHeight(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

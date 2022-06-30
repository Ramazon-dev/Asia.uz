import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:flutter/material.dart';

class TabAddCardsWidget extends StatelessWidget {
  const TabAddCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(getWidth(20)),
      padding: EdgeInsets.only(
        top: getHeight(30),
        bottom: getHeight(20),
        right: getWidth(20),
        left: getWidth(20),
      ),
      height: getHeight(250.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(getWidth(30.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  borderRadius: BorderRadius.circular(getHeight(20))),
              primary: Colors.orange.shade300,
              fixedSize: Size(getWidth(530), getHeight(80)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle,
                  color: AppColors.whiteColor,
                  size: getHeight(40),
                ),
                SizedBox(width: getWidth(35.0)),
                Text(
                  'Добавить имеющуюся карту'.tr(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(24.0),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: getHeight(24)),
          // ),
          Text(
            'Вы можете добавить физическую карту лояльности отсканировав штрих-код'
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(24.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(height: getHeight(20)),
        ],
      ),
    );
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:flutter/material.dart';

class AddCardsWidget extends StatelessWidget {
  const AddCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(getWidth(13.0)),
      padding: EdgeInsets.all(getWidth(10)),
      height: getHeight(123.0),
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
              fixedSize: Size(getWidth(320), getHeight(50)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle, color: AppColors.whiteColor),
                SizedBox(width: getWidth(15.0)),
                Text(
                  'Добавить имеющуюся карту'.tr(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: getWidth(16.0),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: getHeight(15)),
          Text(
            'Вы можете добавить физическую карту лояльности отсканировав штрих-код'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

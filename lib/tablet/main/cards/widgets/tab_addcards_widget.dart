import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:flutter/material.dart';

class TabAddCardsWidget extends StatelessWidget {
  const TabAddCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          borderRadius: BorderRadius.circular(getHeight(20)),
        ),
        primary: const Color(0xffF39949),
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
    );
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TabCardWidget extends StatelessWidget {
  const TabCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ballace = GetStorage().read("totalBalance").toString();
    double total = double.parse(ballace);
    int son = total.toInt();
    String? sona = son.toString();

    return Container(
      height: getHeight(300),
      width: getWidth(525),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(
          getWidth(20.0),
        ),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/card_other.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: getHeight(150),
            width: getWidth(495),
            child: Text(
              GetStorage().read("qrcode") ?? '2935 **** **** 1562'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: getWidth(32.0),
              ),
            ),
          ),
          Positioned(
            width: getWidth(495),
            top: getHeight(230),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Баланс:'.tr(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(24.0),
                  ),
                ),
                Text(
                  MoneyFormatter.moneyFormat(sona + "as") + " " + 'сумов'.tr(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(24.0),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: getHeight(0),
            bottom: getHeight(0),
            child: Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(top: getHeight(15), left: getWidth(255)),
              height: getHeight(36),
              width: getWidth(128),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(getHeight(20)),
                  topLeft: Radius.circular(getHeight(20)),
                ),
                color: const Color(0xff800D0D0D),
              ),
              child: Text(
                "Основная".tr(),
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: getHeight(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

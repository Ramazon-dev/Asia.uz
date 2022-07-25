import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TotalBallance extends StatelessWidget {
  const TotalBallance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ballace = GetStorage().read("totalBalance").toString();
    double total = double.parse(ballace);
    int son = total.toInt();
    String? sona = son.toString();

    return GetStorage().read("barcode") == null
        ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(getWidth(13.0)),
            padding: EdgeInsets.all(getWidth(10)),
            height: getHeight(85.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(getWidth(15.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ОБЩИЙ БАЛАНС',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getHeight(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/coin.png"),
                    const SizedBox(width: 10),
                    Text(
                      MoneyFormatter.moneyFormat(sona + "as"),
                      style: TextStyle(
                        color: AppColors.orangeColor,
                        fontSize: getHeight(24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "сумов".tr(),
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getHeight(16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
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
                Text(
                  "Номер карты: 2935 **** **** 1562",
                  style: TextStyle(
                    color: AppColors.drawerTextColor,
                    fontSize: getHeight(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: getHeight(17)),
                Text(
                  'ОБЩИЙ БАЛАНС',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getHeight(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  MoneyFormatter.moneyFormat(sona + "as") + " " + 'сумов'.tr(),
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontSize: getHeight(24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
  }
}

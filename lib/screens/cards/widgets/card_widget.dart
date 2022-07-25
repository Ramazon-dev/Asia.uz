import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ballace = GetStorage().read("totalBalance").toString();
    double total = double.parse(ballace);
    int son = total.toInt();
    String? sona = son.toString();
    return Container(
      height: getHeight(200),
      width: getWidth(319),
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        borderRadius: BorderRadius.circular(
          getWidth(15.0),
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
          // Positioned(
          //   width: getWidth(315),
          //   top: getHeight(30),
          //   child: Text(
          //     'Ваша карта лояльности'.tr(),
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: AppColors.whiteColor,
          //       fontWeight: FontWeight.w400,
          //       fontSize: getWidth(18.0),
          //     ),
          //   ),
          // ),
          Positioned(
            width: getWidth(315),
            top: getHeight(108),
            child: Text(
              GetStorage().read("qrcode") ?? '2935 **** **** 1562'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: getWidth(20.0),
              ),
            ),
          ),
          Positioned(
            width: getWidth(315),
            top: getHeight(147),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Баланс:'.tr(),
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: getWidth(16.0),
                    ),
                  ),
                  Text(
                    MoneyFormatter.moneyFormat(sona + "as") +
                        " " +
                        'сумов'.tr(),
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: getWidth(16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: getHeight(0),
            bottom: getHeight(0),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: getHeight(15), left: getWidth(255)),
              height: getHeight(25),
              width: getWidth(82),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(getHeight(15)),
                  topLeft: Radius.circular(getHeight(15)),
                ),
                color: const Color(0xff800D0D0D),
              ),
              child: Text(
                "Основная".tr(),
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: getHeight(11),
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

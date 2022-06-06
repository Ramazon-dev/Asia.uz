import 'dart:ui';

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/no_internet/show_cards.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: getHeight(190),
          left: getWidth(44),
          right: getWidth(44),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/no_internet.png",
              height: getHeight(200),
            ).only(bottom: getHeight(30)),
            // SvgPicture.asset(
            //   "assets/images/no_internet.svg",
            //   height: getHeight(200),
            // ).only(bottom: getHeight(30)),
            Text(
              "Нет подключения к сети",
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
              ),
            ).only(bottom: getHeight(40)),
            Text(
              """Доступный функционал в офлайн
режиме – начисление/списание
бонусов с помощью QR-кода""",
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
                color: AppColors.textTite,
              ),
              textAlign: TextAlign.center,
            ).only(bottom: getHeight(40)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.transparentColor,
                elevation: 0,
                fixedSize: Size(getWidth(285), getHeight(50)),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: const Color(0xffF07F1C),
                    width: getWidth(2),
                  ),
                  borderRadius: BorderRadius.circular(getHeight(25)),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowCards(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/qr_button.png")
                      .only(right: getWidth(10)),
                  Text(
                    "Показать QR-код",
                    style: TextStyle(
                      fontSize: getHeight(16),
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ).only(bottom: getHeight(60)),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                child: Image.asset(
                  "assets/images/float_button.png",
                  height: getHeight(54),
                ),
                radius: getHeight(30),
                backgroundColor: AppColors.unselectedColor,
              ).only(bottom: getHeight(8)),
            ),
            Text(
              "Попытаться подключиться",
              style: TextStyle(
                fontSize: getHeight(getHeight(12)),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

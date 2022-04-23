import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/no_internet/show_cards.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: getHeight(190),
          left: getWidth(44),
          right: getWidth(44),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/no_internet.svg",
              height: getHeight(200),
            ).only(bottom: getHeight(30)),
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
            ).only(bottom: getHeight(40)),
            MyElevatedButton(
              sideColor: AppColors.orangeColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowCards(),
                  ),
                );
              },
              text: "Показать QR-код",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.unselectedColor,
        child: Icon(
          Icons.restart_alt,
          size: getHeight(40),
          color: AppColors.black,
        ),
      ),
    );
  }
}

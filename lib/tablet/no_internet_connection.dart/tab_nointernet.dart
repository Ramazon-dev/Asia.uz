import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/tablet/no_internet_connection.dart/show_cards.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class TabNoConnectionPage extends StatelessWidget {
  const TabNoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: getHeight(100),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            height: getHeight(20),
            width: getWidth(30),
          ).only(left: getWidth(15)),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_internet.png",
              fit: BoxFit.cover,
              height: getHeight(338),
            ).only(bottom: getHeight(75)),
            Text(
              "Нет подключения к сети",
              style: TextStyle(
                fontSize: getHeight(24),
                fontWeight: FontWeight.w500,
              ),
            ).only(bottom: getHeight(40)),
            Text(
              """Доступный функционал в офлайн
режиме – начисление/списание
бонусов с помощью QR-кода""",
              style: TextStyle(
                fontSize: getHeight(24),
                fontWeight: FontWeight.w500,
                color: AppColors.textTite,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeight(75)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.transparentColor,
                elevation: 0,
                fixedSize: Size(getWidth(473), getHeight(80)),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: const Color(0xffF07F1C),
                    width: getWidth(2),
                  ),
                  borderRadius: BorderRadius.circular(getHeight(65)),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabShowCards(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/qr_button.png",
                    height: getHeight(40),
                    fit: BoxFit.cover,
                  ).only(right: getWidth(22)),
                  Text(
                    "Показать QR-код",
                    style: TextStyle(
                      fontSize: getHeight(32),
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "Попытаться подключиться",
              style: TextStyle(
                fontSize: getHeight(getHeight(12)),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ).only(bottom: getHeight(16)),
            InkWell(
              onTap: () async {
                bool hasInternet =
                    await InternetConnectionChecker().hasConnection;
                debugPrint("has internet: $hasInternet");
                if (hasInternet) {
                  Navigator.pop(context);
                }
              },
              child: CircleAvatar(
                child: Image.asset(
                  "assets/images/float_button.png",
                  height: getHeight(54),
                ),
                radius: getHeight(30),
                backgroundColor: AppColors.unselectedColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

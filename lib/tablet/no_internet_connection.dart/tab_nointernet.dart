import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabNoConnectionPage extends StatelessWidget {
  const TabNoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_internet.png",
              fit: BoxFit.cover,
              height: getHeight(338),
            ).only(bottom: getHeight(75), top: getHeight(200)),
            Text(
              "Нет подключения к сети".tr(),
              style: TextStyle(
                fontSize: getHeight(24),
                fontWeight: FontWeight.w500,
              ),
            ).only(bottom: getHeight(40)),
            SizedBox(
              width: getWidth(425),
              child: Text(
                "Доступный функционал в офлайн режиме – начисление/списание бонусов с помощью QR-кода"
                    .tr(),
                style: TextStyle(
                  fontSize: getHeight(24),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textTite,
                ),
                textAlign: TextAlign.center,
              ),
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
                    "Показать QR-код".tr(),
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
              "Попытаться подключиться".tr(),
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

import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
  @override
  Widget build(BuildContext context) {
    // agar internet ishlamay qolsa shu page ga otadi
    // bu pagedan internet yoq paytida qrcode va kartani korsatish mumkin bolgan
    // page ga otish mumkin yoki pasdagi button orqali internetni qayta tekshirish
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: getWidth(44),
          right: getWidth(44),
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/no_internet.png",
              height: getHeight(200),
            ).only(bottom: getHeight(30)),
            Text(
              "Нет подключения к сети".tr(),
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
              ),
            ).only(bottom: getHeight(40)),
            Text(
              "Доступный функционал в офлайн режиме – начисление/списание бонусов с помощью QR-кода"
                  .tr(),
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w400,
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
                    "Показать QR-код".tr(),
                    style: TextStyle(
                      fontSize: getHeight(16),
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
            ).only(bottom: getHeight(20)),
            InkWell(
              child: CircleAvatar(
                child: Image.asset(
                  "assets/images/float_button.png",
                  height: getHeight(54),
                ),
                radius: getHeight(30),
                backgroundColor: AppColors.unselectedColor,
              ).only(bottom: getHeight(8)),
              onTap: () async {
                bool hasInternet =
                    await InternetConnectionChecker().hasConnection;
                debugPrint("has internet: $hasInternet");
                if (hasInternet) {
                  Navigator.pop(context);
                }
                setState(() {});
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

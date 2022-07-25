import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TabTouchIDPage extends StatefulWidget {
  const TabTouchIDPage({Key? key}) : super(key: key);

  @override
  State<TabTouchIDPage> createState() => _TabTouchIDPageState();
}

class _TabTouchIDPageState extends State<TabTouchIDPage> {
  bool isActiv = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // color: Colors.yellow,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(
          top: getHeight(400),
          left: getWidth(80),
          right: getWidth(80),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/biometric.png",
              height: getHeight(140),
            ),
            MyTextWidget(
              text:
                  'Хотите использовать Touch ID для быстрого входа в приложение?',
              fontWeight: FontWeight.w400,
              fontSize: 36,
              textAlign: TextAlign.center,
            ).only(bottom: getHeight(24), top: getHeight(24)),
            SizedBox(height: getHeight(60)),
            GetStorage().read("hasBiometric") == "true"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Использовать Touch ID",
                        style: TextStyle(
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w400,
                          color: AppColors.drawerTextColor,
                        ),
                      ),
                      Switch(
                        // focusColor: AppColors.drawerTextColor,
                        // hoverColor: AppColors.drawerTextColor,
                        // activeTrackColor: AppColors.drawerTextColor,
                        // inactiveTrackColor: AppColors.drawerTextColor,
                        activeColor: AppColors.orangeColor,
                        inactiveThumbColor: AppColors.drawerTextColor,
                        value: isActiv,
                        onChanged: (sda) {
                          isActiv = sda;
                          debugPrint("isActive: $isActiv");
                          setState(() {});
                        },
                      ),
                    ],
                  )
                : SizedBox(height: getHeight(60)),
            SizedBox(height: getHeight(80)),
            MyElevatedButton(
              height: getHeight(83),
              width: getWidth(473),
              radius: 30,
              textSize: getHeight(32),
              fontWeight: FontWeight.w600,
              text: "Продолжить",
              sideColor: AppColors.orangeColor,
              onPressed: () {
                GetStorage().write("touchid", isActiv.toString());
                debugPrint(GetStorage().read("touchid"));
                GetStorage().read("isverified") == "true"
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabMainPage(),
                        ),
                        (route) => false,
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabProfilePage(),
                        ),
                      );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

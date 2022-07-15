import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TouchIDPage extends StatefulWidget {
  const TouchIDPage({Key? key}) : super(key: key);

  @override
  State<TouchIDPage> createState() => _TouchIDPageState();
}

class _TouchIDPageState extends State<TouchIDPage> {
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
          top: getHeight(260),
          left: getWidth(40),
          right: getWidth(40),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/biometric.png",
            ),
            MyTextWidget(
              text:
                  'Хотите использовать Touch ID для быстрого входа в приложение?',
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ).only(bottom: getHeight(24), top: getHeight(24)),
            SizedBox(height: getHeight(60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Использовать Touch ID",
                  style: TextStyle(
                    fontSize: getHeight(12),
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
            ),
            SizedBox(height: getHeight(80)),
            MyElevatedButton(
              textSize: getHeight(18),
              fontWeight: FontWeight.w600,
              onPressed: () {
                GetStorage().write("touchid", isActiv.toString());
                debugPrint(GetStorage().read("touchid"));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              text: "Продолжить",
              sideColor: AppColors.orangeColor,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

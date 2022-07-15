import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/info/info.dart';
import 'package:flutter/material.dart';

class CashBackPage extends StatelessWidget {
  const CashBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(
          top: getHeight(400),
          left: getWidth(20),
          right: getWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Получайие 1% Кэшбэка при покупке до 150 000 сум, 2% при покупке на 200 000, 3% при покупке на 300 000 сум"
                  .tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(160)),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: getHeight(5),
                    backgroundColor: AppColors.teal,
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    maxRadius: getHeight(5),
                    backgroundColor: AppColors.orangeColor,
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    maxRadius: getHeight(5),
                    backgroundColor: AppColors.teal,
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(20)),
            MyElevatedButton(
              textColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Далее",
              textSize: getHeight(18),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

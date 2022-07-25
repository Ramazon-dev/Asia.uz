import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bu page da foydalanuvchini loyal kartasi saqlanadi
    // agar foydalanuvchining loyal kartasi xali kiritilmagan bolsa unda
    // foydalanuvchi loyal cartani scaner qlib qo'shishi mumkin boladi
    SizeConfig().init(context);
    debugPrint("cards lenth: ${GetStorage().read("cards")}");
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: getHeight(120)),
              height: getHeight(450.0),
              width: double.infinity,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  Text(
                    'Ваши карты лояльности'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(20.0),
                    ),
                  ),
                  SizedBox(height: getHeight(15.0)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NoConnectionPage(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      child: ListView(
                        // padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 20),
                          const CardWidget(),
                          const SizedBox(width: 20),
                          // const PersonalCard(),
                          GetStorage().read('cards') != 2
                              ? Container()
                              : const PersonalCard().only(right: getWidth(20)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(24)),
                  GetStorage().read('cards') != 2
                      ? const AddCardsWidget()
                      : Container(),
                ],
              ),
            ),
            const TotalBallance(),
            // mana shu joyda tekshiriladi foydalanuvchining loyal kartasi bormi

            // bu joyda foydalanuvchining tolovlar tarixi joylashgan boladi
            // bu malumotlarni loyality card api dan olinadi
            const PaymentHistoryWidget(),
          ],
        ),
      ),
    );
  }
}

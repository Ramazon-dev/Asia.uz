import 'package:asia_uz/screens/cards/widgets/payment_history.dart';
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
    debugPrint(GetStorage().read("token"));
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: getHeight(120)),
              height: getHeight(400.0),
              width: double.infinity,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  Text(
                    'Добро пожаловать в систему лояльности'.tr(),
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
                    child: const CardWidget(),
                  ),
                ],
              ),
            ),
            // mana shu joyda tekshiriladi foydalanuvchining loyal kartasi bormi
            GetStorage().read('barcode') == null
                ? const AddCardsWidget()
                : Container(),

            // bu joyda foydalanuvchining tolovlar tarixi joylashgan boladi
            // bu malumotlarni loyality card api dan olinadi
            const PaymentHistoryWidget(),
          ],
        ),
      ),
    );
  }
}

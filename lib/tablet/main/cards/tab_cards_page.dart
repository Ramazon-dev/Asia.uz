import 'package:asia_uz/tablet/main/cards/widgets/tab_payment_history.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabCardsPage extends StatelessWidget {
  const TabCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: getHeight(130)),
              height: getHeight(550.0),
              width: double.infinity,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  SizedBox(
                    width: getWidth(511),
                    child: Text(
                      'Добро пожаловать в систему лояльности'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: getWidth(32.0),
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(30.0)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TabNoConnectionPage(),
                          ),
                        );
                      },
                      child: const TabCardWidget()),
                ],
              ),
            ),
            GetStorage().read('barcode') == null
                ? const TabAddCardsWidget()
                : Container(),
            const TabPaymentHistory()
          ],
        ),
      ),
    );
  }
}

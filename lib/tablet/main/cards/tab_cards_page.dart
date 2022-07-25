import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabCardsPage extends StatelessWidget {
  const TabCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(GetStorage().read('cards').toString());
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: getHeight(130)),
              height: getHeight(600.0),
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
                    child: SizedBox(
                      height: getHeight(300),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: getWidth(150)),
                          const TabCardWidget(),
                          SizedBox(width: getWidth(40)),
                          GetStorage().read('cards') != 2
                              ? Container()
                              : const TabPersonalCard()
                                  .only(right: getWidth(20)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  GetStorage().read('cards') != 2
                      ? const TabAddCardsWidget()
                      : Container(),
                ],
              ),
            ),
            const TabTotalBallance(),
            const TabPaymentHistory()
          ],
        ),
      ),
    );
  }
}

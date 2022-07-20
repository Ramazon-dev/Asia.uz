import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            fit: BoxFit.cover,
            height: getHeight(15),
            width: getWidth(20),
          ),
          color: AppColors.whiteColor,
        ),
        text: "История",
        textSize: getHeight(20),
        action: IconButton(
          onPressed: () {},
          icon: Container(),
        ),
      ),
      body: FutureBuilder<List<LoyalityCardsModel>>(
        future: LoyalityCardsService.getLoyalityCardsService(),
        builder: (context, AsyncSnapshot<List<LoyalityCardsModel>> snap) {
          if (snap.hasData) {
            if (snap.data![0].history!.isEmpty) {
              return Center(
                child: Text(
                  "История выплат пуста.".tr(),
                  style: const TextStyle(
                    color: AppColors.drawerTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Container(
              padding: EdgeInsets.all(getHeight(15)),
              child: ListView.builder(
                itemCount: snap.data![0].history!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: getHeight(10),
                      left: getWidth(3),
                      right: getWidth(3),
                    ),
                    padding: EdgeInsets.all(getHeight(10)),
                    alignment: Alignment.center,
                    height: getHeight(60),
                    width: getWidth(350),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(getHeight(15)),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.bgColor,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "08 iyun 15:50",
                              style: TextStyle(
                                color: AppColors.drawerTextColor,
                                fontSize: getHeight(12),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "сум".tr(),
                              style: TextStyle(
                                color: AppColors.drawerTextColor,
                                fontSize: getHeight(12),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Выплачено".tr(),
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: getHeight(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "215.000",
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: getHeight(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snap.hasError) {
            return const Center(
              child: Text(
                "Error!",
                style: TextStyle(
                  color: AppColors.textRed,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          return Center(
            child: Image.asset(
              "assets/images/loading_indicator.gif",
              color: AppColors.orange,
              fit: BoxFit.cover,
              height: getHeight(70),
            ),
          );
        },
      ),
    );
  }
}

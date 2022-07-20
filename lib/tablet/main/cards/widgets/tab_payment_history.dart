import 'package:asia_uz/tablet/main/cards/tab_payment_history_page.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/loyality_cards_model.dart';

class TabPaymentHistory extends StatelessWidget {
  const TabPaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LoyalityCardsModel>>(
      future: LoyalityCardsService.getLoyalityCardsService(),
      builder: (context, AsyncSnapshot<List<LoyalityCardsModel>> snap) {
        if (snap.hasData) {
          return Container(
            margin: EdgeInsets.only(top: getHeight(15)),
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(50),
              vertical: getHeight(28),
            ),
            color: AppColors.whiteColor,
            height: getHeight(550),
            width: getWidth(834),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "История выплат".tr(),
                      style: TextStyle(
                        fontSize: getHeight(24),
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TabPaymentHistoryPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Все".tr(),
                        style: TextStyle(
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w600,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: getHeight(20)),
                  alignment: Alignment.topCenter,
                  height: getHeight(400),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: getHeight(1),
                      color: AppColors.teal,
                    ),
                    borderRadius: BorderRadius.circular(getHeight(30)),
                  ),
                  // color: Colors.yellow,
                  child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.only(top: getHeight(15)),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: getHeight(77),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              hoverColor: AppColors.teal,
                              tileColor: AppColors.teal,
                              selectedColor: AppColors.teal,
                              leading: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "08 iyun 15:50",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: getHeight(15),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Выплачено".tr(),
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: getHeight(20),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "сум".tr(),
                                    style: TextStyle(
                                      color: AppColors.drawerTextColor,
                                      fontSize: getHeight(15),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "215.000",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: getHeight(20),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: getWidth(20),
                              endIndent: getWidth(20),
                              height: getHeight(1),
                              color: AppColors.teal,
                              thickness: getWidth(1),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snap.hasError) {
          return Center(
            child: Image.asset(
              "assets/images/loading_indicator.gif",
              color: AppColors.orange,
              fit: BoxFit.cover,
              height: getHeight(70),
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
    );
  }
}

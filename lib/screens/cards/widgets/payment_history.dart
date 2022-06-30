import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/loyality_cards_model.dart';
import 'package:flutter/material.dart';

class PaymentHistoryWidget extends StatelessWidget {
  const PaymentHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getHeight(15)),
      padding: EdgeInsets.all(getWidth(16)),
      color: AppColors.whiteColor,
      height: getHeight(350),
      width: getWidth(375),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "История выплат".tr(),
                style: TextStyle(
                  fontSize: getHeight(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Text(
                "Все".tr(),
                style: TextStyle(
                  fontSize: getHeight(16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: getHeight(12)),
            padding: EdgeInsets.all(getWidth(15)),
            alignment: Alignment.topCenter,
            height: getHeight(270),
            decoration: BoxDecoration(
              border: Border.all(
                width: getHeight(0.2),
                color: AppColors.teal,
              ),
              borderRadius: BorderRadius.circular(getHeight(15)),
            ),
            child: FutureBuilder<List<LoyalityCardsModel>>(
                future: LoyalityCardsService.getLoyalityCardsService(),
                builder:
                    (context, AsyncSnapshot<List<LoyalityCardsModel>> snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.only(top: getHeight(5)),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: getHeight(50),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "08 iyun 15:50",
                                    style: TextStyle(
                                      color: AppColors.black,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: AppColors.black,
                                      fontSize: getHeight(14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: getHeight(8)),
                              Divider(
                                height: getHeight(0.1),
                                color: AppColors.teal,
                                thickness: getWidth(1),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snap.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

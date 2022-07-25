import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TabPaymentHistoryPage extends StatelessWidget {
  const TabPaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            fit: BoxFit.cover,
            height: getHeight(20),
            width: getWidth(30),
          ),
          color: AppColors.whiteColor,
        ).only(left: getWidth(20)),
        text: "История",
        textSize: getHeight(24),
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
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(getHeight(25)),
              child: ListView.builder(
                itemCount: snap.data![0].history!.length,
                itemBuilder: (context, index) {
                  DateTime month = DateTime.now();

                  List<History?> listOfHistory = List.generate(
                    snap.data![0].history!.length,
                    (index) => snap.data![0].history!.last.createdAt!.month ==
                            month.month
                        ? snap.data![0].history!.last
                        : null,
                  );

                  DateTime? created = listOfHistory[index]!.createdAt;
                  // debugPrint(created.toString());
                  return Container(
                    margin: EdgeInsets.only(
                      top: getHeight(10),
                      // bottom: getHeight(10),
                      left: getWidth(3),
                      right: getWidth(3),
                    ),
                    padding: EdgeInsets.all(getHeight(25)),
                    alignment: Alignment.center,
                    height: getHeight(100),
                    // width: getWidth(350),
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
                              "${created!.day}.${created.month}   ${created.hour}:${created.minute}",
                              style: TextStyle(
                                color: AppColors.drawerTextColor,
                                fontSize: getHeight(20),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "сум".tr(),
                              style: TextStyle(
                                color: AppColors.drawerTextColor,
                                fontSize: getHeight(20),
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
                                fontSize: getHeight(18),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              listOfHistory[index]!.amount.toString(),
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: getHeight(18),
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
              fit: BoxFit.cover,
              height: getHeight(70),
            ),
          );
        },
      ),
    );
  }
}

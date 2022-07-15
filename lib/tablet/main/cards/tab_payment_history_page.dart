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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(getHeight(25)),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
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
                        "08 iyun 15:50",
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
                        "215.000",
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
      ),
    );
  }
}

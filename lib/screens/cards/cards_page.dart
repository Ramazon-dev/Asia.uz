import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/cards/widgets/add_cards_widget.dart';
import 'package:asia_uz/screens/cards/widgets/card_widget.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:asia_uz/screens/no_internet/no_connection.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    'Добро пожаловать в систему\nлояльности',
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
            const AddCardsWidget(),
            Container(
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
                        "История выплат",
                        style: TextStyle(
                          fontSize: getHeight(16),
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Все",
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
                        width: getHeight(1),
                        color: AppColors.teal,
                      ),
                      borderRadius: BorderRadius.circular(getHeight(15)),
                    ),
                    // color: Colors.yellow,
                    child: ListView.builder(
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
                                    "СУМ",
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
                                    "Выплачено",
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
                                // indent: getWidth(15),
                                // endIndent: getWidth(15),
                                height: getHeight(0.1),
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
            ),
          ],
        ),
      ),
    );
  }
}

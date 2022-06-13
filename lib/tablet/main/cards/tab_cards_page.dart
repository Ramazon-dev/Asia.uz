import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/qrcode/qr_scanner_page.dart';
import 'package:asia_uz/tablet/main/cards/widgets/tab_cards_widget.dart';
import 'package:asia_uz/tablet/no_internet_connection.dart/tab_nointernet.dart';
import 'package:flutter/material.dart';

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
                      'Добро пожаловать в систему\nлояльности',
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
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(getWidth(20)),
              padding: EdgeInsets.only(
                top: getHeight(15),
                right: getWidth(20),
                left: getWidth(20),
              ),
              height: getHeight(250.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(getWidth(30.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QRCodeScannerPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(getHeight(20))),
                      primary: Colors.orange.shade300,
                      fixedSize: Size(getWidth(530), getHeight(80)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: AppColors.whiteColor,
                          size: getHeight(40),
                        ),
                        SizedBox(width: getWidth(35.0)),
                        Text(
                          'Добавить имеющуюся карту',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getWidth(24.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(24)),
                  // ),
                  Text(
                    'Вы можете добавить физическую карту лояльности отсканировав штрих-код',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: getWidth(24.0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: getHeight(20)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(15)),
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(50),
                vertical: getHeight(28),
              ),
              color: AppColors.whiteColor,
              height: getHeight(333),
              width: getWidth(834),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "История выплат",
                        style: TextStyle(
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Все",
                        style: TextStyle(
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w600,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: getHeight(20)),
                    alignment: Alignment.topCenter,
                    height: getHeight(210),
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
                      padding: EdgeInsets.only(top: getHeight(10)),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: getHeight(70),
                          child: Column(
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
                                      "Выплачено",
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
                                      "СУМ",
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
                                indent: getWidth(15),
                                endIndent: getWidth(15),
                                height: getHeight(25),
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

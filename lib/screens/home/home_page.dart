import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // home page oz ichiga appbar va bottomnavbardan bowqa page ichidigi xamma widgetlarni oladi
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(540),
              padding: EdgeInsets.only(
                top: getHeight(
                  getValueForScreenType(
                    context: context,
                    mobile: 125,
                    tablet: 150,
                  ),
                ),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: MyTextWidget(
                      text: 'Покажите QR-код кассиру'.tr(),
                      fontSize: getHeight(20),
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    width: double.infinity,
                    height: getHeight(23),
                  ),
                  SizedBox(height: getHeight(17.0)),
                  InkWell(
                    onTap: () {
                      String platform = Platform.operatingSystem;
                      debugPrint(platform);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaceId(),
                        ),
                      );
                    },
                    child: QrCodeCreator(
                      text: GetStorage().read("qrcode") ?? "",
                      size: getHeight(280),
                    ),
                  ),
                  SizedBox(height: getHeight(20.0)),
                  cashback(),
                  SizedBox(height: getHeight(18.0)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: getHeight(20)),
              margin: EdgeInsets.only(top: getHeight(25)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getHeight(10)),
                  topRight: Radius.circular(getHeight(10)),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextWidget(
                          text: 'События'.tr(),
                          textAlign: TextAlign.left,
                          fontSize: getHeight(16),
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.black,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewsPage(),
                            ),
                          ),
                          child: MyTextWidget(
                            text: 'Все'.tr(),
                            textAlign: TextAlign.right,
                            fontSize: getHeight(16),
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // api ga page ning faqatgina shu qismi boglangani uchun
                  //shu qismini aloxida widgetga olindi
                  const NewsItemWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  cashback() {
    String ballace = GetStorage().read("totalBalance").toString();
    double total = double.parse(ballace);
    int summa = total.toInt();
    String? totalBallance = summa.toString();

    String amount = GetStorage().read("amount").toString();
    double doubleAmount = double.parse(amount);
    int intAmount = doubleAmount.toInt();
    String totalAmount = intAmount.toString();

    debugPrint(totalBallance.toString());
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'На счету'.tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getWidth(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              MyTextWidget(
                textAlign: TextAlign.right,
                text: 'Расход за месяц'.tr(),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: getWidth(4.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextWidget(
                text: MoneyFormatter.moneyFormat(totalBallance + "as") +
                    " " +
                    'сумов'.tr(),
                textAlign: TextAlign.left,
                textColor: AppColors.orange,
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
              ),
              MyTextWidget(
                  text: MoneyFormatter.moneyFormat(totalAmount + "as") +
                      " " +
                      'сумов'.tr(),
                textAlign: TextAlign.right,
                textColor: AppColors.drawerTextColor,
                fontSize: getHeight(13),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // information(BuildContext context) {
  //   return SizedBox(
  //     height: getHeight(150),
  //     width: double.infinity,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsets.symmetric(
  //             horizontal: getWidth(10.0),
  //             vertical: getHeight(10.0),
  //           ),
  //           child: Container(
  //             height: getHeight(120.0),
  //             width: getWidth(228.0),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(
  //                 getWidth(15.0),
  //               ),
  //               image: const DecorationImage(
  //                 image: AssetImage(
  //                   'assets/images/i.png',
  //                 ),
  //                 // fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}

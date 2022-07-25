import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = ScreenUtil().screenHeight;
    double height = ScreenUtil().screenWidth;
    debugPrint(
      "aaaa height :$height and screen width: $width",
    );

    debugPrint("qrcode: ${GetStorage().read("qrcode")}");
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      body: Column(
        children: [
          Container(
            height: getHeight(800),
            padding: EdgeInsets.only(
              top: getHeight(150),
            ),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: MyTextWidget(
                    text: 'Покажите QR-код кассиру'.tr(),
                    fontSize: getHeight(32),
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  width: double.infinity,
                  height: getHeight(35),
                ),
                SizedBox(height: getHeight(40.0)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabOnBoardingScreenPage(),
                      ),
                    );
                  },
                  child: QrCodeCreator(
                    // text: "qrcode",
                    text: GetStorage().read("qrcode") ?? "",
                    size: 420,
                  ),
                ),
                SizedBox(height: getHeight(40.0)),
                cashback(),
                SizedBox(height: getHeight(18.0)),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: getHeight(278),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getHeight(20)),
                topRight: Radius.circular(getHeight(20)),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(50.0),
                    vertical: getHeight(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextWidget(
                        text: 'События'.tr(),
                        textAlign: TextAlign.left,
                        fontSize: getHeight(24),
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
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const TabNewsItemWidget()
                // information(context),
              ],
            ),
          ),
        ],
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
        horizontal: getWidth(60.0),
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
                  fontSize: getWidth(24.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              MyTextWidget(
                textAlign: TextAlign.right,
                text: 'Расход за месяц'.tr(),
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: getWidth(15.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextWidget(
                text: MoneyFormatter.moneyFormat(totalBallance + "as") +
                    " " +
                    'сумов'.tr(),
                textAlign: TextAlign.left,
                textColor: AppColors.orange,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
              MyTextWidget(
                text: MoneyFormatter.moneyFormat(totalAmount + "as") +
                    " " +
                    'сумов'.tr(),
                textAlign: TextAlign.right,
                textColor: AppColors.teal,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

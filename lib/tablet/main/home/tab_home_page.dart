import 'package:asia_uz/tablet/auth/info/tab_bonus.dart';
import 'package:asia_uz/tablet/main/home/widgets/tab_news_item.dart';
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
                        builder: (context) => const TabBonusPage(),
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
                text: '0 sum',
                textAlign: TextAlign.left,
                textColor: AppColors.orange,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
              MyTextWidget(
                text: "0 " + 'баллов'.tr(),
                textAlign: TextAlign.right,
                textColor: AppColors.teal,
                fontSize: getHeight(20),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  information(BuildContext context) {
    return SizedBox(
      height: getHeight(190),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(10.0),
              vertical: getHeight(10.0),
            ),
            child: Container(
              height: getHeight(160.0),
              width: getWidth(308.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getWidth(15.0),
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/i.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

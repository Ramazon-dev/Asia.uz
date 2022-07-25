import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabOnBoardingScreenPage extends StatefulWidget {
  const TabOnBoardingScreenPage({Key? key}) : super(key: key);

  @override
  State<TabOnBoardingScreenPage> createState() =>
      _TabOnBoardingScreenPageState();
}

class _TabOnBoardingScreenPageState extends State<TabOnBoardingScreenPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() => isLastPage = index == 2);
              },
              children: [
                firstPageMethod(),
                secondPageMethod(),
                thirdPageMethod(),
              ],
            ),
          ),
          Positioned(
            top: getHeight(1000),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Color(0xffd9d9d9),
                        activeDotColor: AppColors.orangeColor,
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                    ),
                  ),
                  isLastPage
                      ? MyElevatedButton(
                          height: 83,
                          width: 473,
                          textColor: AppColors.whiteColor,
                          primaryColor: AppColors.orangeColor,
                          text: "Закрыть",
                          textSize: getHeight(24),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabMainPage(),
                              ),
                              (route) => false,
                            );
                          },
                        ).only(top: getHeight(20), bottom: getHeight(12))
                      : Column(
                          children: [
                            MyElevatedButton(
                              textColor: AppColors.whiteColor,
                              primaryColor: AppColors.orangeColor,
                              text: "Далее",
                              height: 83,
                              width: 473,
                              radius: 30,
                              textSize: getHeight(24),
                              onPressed: () => controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              ),
                            ).only(top: getHeight(20), bottom: getHeight(12)),
                            TextButton(
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabMainPage(),
                                ),
                                (route) => false,
                              ),
                              child: Text(
                                "Пропустить",
                                style: TextStyle(
                                  color: AppColors.bottomUnselectedColor,
                                  fontSize: getHeight(24),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container thirdPageMethod() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(
        top: getHeight(300),
        left: getWidth(60),
        right: getWidth(60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/onboarding_location.png",
            height: getHeight(350),
            fit: BoxFit.cover,
          ),
          SizedBox(height: getHeight(120)),
          Text(
            "Удобный поиск магазинов , новостей и связи с тех поддержкой в одном приложении"
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getHeight(24),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(160)),
        ],
      ),
    );
  }

  Container secondPageMethod() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(
        top: getHeight(300),
        left: getWidth(60),
        right: getWidth(60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/onboarding_cashback.png",
            height: getHeight(400),
            fit: BoxFit.cover,
          ),
          SizedBox(height: getHeight(120)),
          Text(
            "Получайие 1% Кэшбэка при покупке до 150 000 сум, 2% при покупке на 200 000, 3% при покупке на 300 000 сум"
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getHeight(24),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(160)),
        ],
      ),
    );
  }

  Container firstPageMethod() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(
        top: getHeight(300),
        left: getWidth(60),
        right: getWidth(60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/onboarding_bonus.png",
            height: getHeight(300),
            fit: BoxFit.cover,
          ),
          SizedBox(height: getHeight(200)),
          Text(
            "Вы получили Бонус 2000 сум за регистрацию в Кэшбэк системе, показывайте QR кассиру и покупайте товары в нашей сети супермаркетов"
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getHeight(24),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(160)),
        ],
      ),
    );
  }
}

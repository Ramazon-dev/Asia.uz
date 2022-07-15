import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 600
          ? buildMobile(context)
          : buildTab(context);
    });
  }

  Scaffold buildMobile(BuildContext context) {
    debugPrint("kirdi");
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        text: 'Контакты',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/arrow_back.png",
            color: AppColors.whiteColor,
          ),
        ),
        action: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(getWidth(15.0)),
                child: Container(
                  height: getHeight(504.0),
                  width: getWidth(331),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      SizedBox(height: getHeight(34.0)),
                      Text(
                        "Контактная информация",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: getWidth(18.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Как связаться с нами?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.teal,
                          fontWeight: FontWeight.w300,
                          fontSize: getWidth(14.0),
                        ),
                      ).only(top: getHeight(15), bottom: getHeight(33)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getWidth(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.call_rounded,
                                  color: AppColors.orangeColor,
                                  size: getHeight(20),
                                ),
                                SizedBox(width: getWidth(20)),
                                Text(
                                  "+998 (90) 962-16-81",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(14.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(45.0)),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_rounded,
                                  color: AppColors.orangeColor,
                                  size: getHeight(20),
                                ),
                                SizedBox(width: getWidth(20)),
                                Text(
                                  'asiauz@gmail.com!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(14.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(45.0)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: AppColors.orangeColor,
                                  size: getHeight(20),
                                ),
                                SizedBox(width: getWidth(20)),
                                Text(
                                  'Головной офис \nАлмазарский район, ул. Шифонур, 8',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(14.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: getHeight(172),
                        width: getWidth(315),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getHeight(15)),
                          // image: const DecorationImage(
                          //   image: AssetImage(""),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/map.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getHeight(40)),
                height: getHeight(100),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/newcardbg.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: getHeight(100),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff800D0D0D),
                  child: Column(
                    children: [
                      Text(
                        "Мы в соцсетях",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ).only(top: getHeight(12), bottom: getHeight(15)),
                      SizedBox(
                        width: getWidth(150),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                "assets/icons/facebook.png",
                              ),
                              height: getHeight(30),
                              fit: BoxFit.cover,
                            ),
                            Image(
                              image: const AssetImage(
                                "assets/icons/telegram.png",
                              ),
                              height: getHeight(30),
                              fit: BoxFit.cover,
                            ),
                            Image(
                              image: const AssetImage(
                                "assets/icons/instagram.png",
                              ),
                              height: getHeight(30),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold buildTab(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        textSize: 32,
        text: 'Contacts',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            height: getHeight(20),
            width: getWidth(30),
          ),
        ),
        action: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(40)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(getWidth(20.0)),
                child: Container(
                  height: getHeight(804.0),
                  width: getWidth(750),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      SizedBox(height: getHeight(35.0)),
                      Text(
                        "Контактная информация",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: getWidth(32.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Как связаться с нами?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.teal,
                          fontWeight: FontWeight.w300,
                          fontSize: getWidth(20.0),
                        ),
                      ).only(top: getHeight(15), bottom: getHeight(33)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getWidth(55),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.call_rounded,
                                  color: AppColors.orangeColor,
                                  size: getHeight(50),
                                ),
                                SizedBox(width: getWidth(25)),
                                Text(
                                  "+998 (90) 962-16-81",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(32.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(50.0)),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_rounded,
                                  color: AppColors.orangeColor,
                                  size: getHeight(50),
                                ),
                                SizedBox(width: getWidth(25)),
                                Text(
                                  'asiauz@gmail.com!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(32.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getHeight(50.0)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: AppColors.orangeColor,
                                  size: getHeight(50),
                                ),
                                SizedBox(width: getWidth(25)),
                                Text(
                                  'Головной офис \nАлмазарский район, ул. Шифонур, 8',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getWidth(32.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: getHeight(20)),
                        height: getHeight(308),
                        width: getWidth(681),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getHeight(18)),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/map.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getHeight(40)),
                height: getHeight(162),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/newcardbg.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: getHeight(162),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff800D0D0D),
                  child: Column(
                    children: [
                      Text(
                        "Мы в соцсетях",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ).only(top: getHeight(16), bottom: getHeight(26)),
                      SizedBox(
                        width: getWidth(312),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                "assets/icons/facebook.png",
                              ),
                              height: getHeight(66),
                              fit: BoxFit.cover,
                            ),
                            Image(
                              image: const AssetImage(
                                "assets/icons/telegram.png",
                              ),
                              height: getHeight(66),
                              fit: BoxFit.cover,
                            ),
                            Image(
                              image: const AssetImage(
                                "assets/icons/instagram.png",
                              ),
                              height: getHeight(66),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        text: 'Contacts',
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
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(25)),
          child: ClipRRect(
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
                  Text(
                    "+998 (90) 962-16-81",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: getWidth(14.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: getHeight(45.0)),
                  Text(
                    'asiauz@gmail.com!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: getWidth(14.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: getHeight(45.0)),
                  Text(
                    'Головной офис Алмазарский район, ул. Шифонур, 8',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: getWidth(14.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: getHeight(172),
                    width: getWidth(315),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getHeight(15)),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/map.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
      // body: Padding(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: getWidth(30.0),
      //     vertical: getHeight(10.0),
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(getWidth(15.0)),
      //     child: Container(
      //       height: getHeight(1028.0),
      //       width: double.infinity,
      //       color: AppColors.whiteColor,
      //       child: Column(
      //         children: [
      //           SizedBox(height: getHeight(32.0)),
      //           Text(
      //             title,
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: AppColors.black,
      //               fontSize: getWidth(32.0),
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //           Container(
      //             height: getHeight(522.0),
      //             width: getWidth(674.0),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(
      //                 getWidth(20.0),
      //               ),
      //               image: DecorationImage(
      //                 image: NetworkImage(image),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ).symmetric(
      //               horizontal: getWidth(10.0), vertical: getHeight(20.0)),
      //           Text(
      //             // 'Встречайте шестой электронный\nкаталог от Asia.uz! Наш каталог\nпредставляет собой сборник лучших\nскидок и весенних предложений.',
      //             discription,
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: AppColors.black,
      //               fontWeight: FontWeight.w400,
      //               fontSize: getWidth(32.0),
      //             ),
      //           ),
      //           SizedBox(height: getHeight(20.0)),
      //           Text(
      //             'Действует с 18 по 31 марта.',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: AppColors.black,
      //               fontSize: getWidth(32.0),
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //           SizedBox(height: getHeight(20.0)),
      //           Text(
      //             'Делайте выгодные покупки вместе с\nнами!',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: AppColors.black,
      //               fontSize: getWidth(32.0),
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

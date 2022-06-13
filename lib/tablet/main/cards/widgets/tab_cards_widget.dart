import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TabCardWidget extends StatelessWidget {
  const TabCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(280),
      width: getWidth(500),
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        borderRadius: BorderRadius.circular(
          getWidth(20.0),
        ),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: getHeight(35),
            width: getWidth(495),
            child: Text(
              'Ваша карта лояльности',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: getWidth(24.0),
              ),
            ),
          ),
          Positioned(
            top: getHeight(130),
            width: getWidth(495),
            child: Text(
              '2935 **** **** 1562',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: getWidth(32.0),
              ),
            ),
          ),
          Positioned(
            width: getWidth(495),
            top: getHeight(210),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Баланс:',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(24.0),
                  ),
                ),
                Text(
                  '2 000.00',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(24.0),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: getHeight(0),
            bottom: getHeight(0),
            child: Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(top: getHeight(15), left: getWidth(255)),
              height: getHeight(36),
              width: getWidth(128),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(getHeight(20)),
                  topLeft: Radius.circular(getHeight(20)),
                ),
                color: const Color(0xff800D0D0D),
              ),
              child: Text(
                "Основная",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: getHeight(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
    // return Container(
    //   height: getHeight(180.0),
    //   width: getWidth(315.0),
    //   decoration: BoxDecoration(
    //     color: AppColors.orangeColor,
    //     borderRadius: BorderRadius.circular(
    //       getWidth(15.0),
    //     ),
    //     image: const DecorationImage(
    //       image: AssetImage(
    //         'assets/images/bg.png',
    //       ),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Column(
    //     children: [
    //       // SizedBox(height: getHeight(35.0)),
    //       // Text(
    //       //   'Ваша карта лояльности',
    //       //   textAlign: TextAlign.center,
    //       //   style: TextStyle(
    //       //     color: AppColors.whiteColor,
    //       //     fontSize: getHeight(18.0),
    //       //     fontWeight: FontWeight.w400,
    //       //   ),
    //       // ),
    //       SizedBox(height: getHeight(66.0)),
    //       Text(
    //         '2935 **** **** 1562',
    //         style: TextStyle(
    //           color: AppColors.whiteColor,
    //           fontWeight: FontWeight.w400,
    //           fontSize: getWidth(24.0),
    //         ),
    //       ),
    //       SizedBox(height: getHeight(20.0)),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Text(
    //             'Баланс:',
    //             style: TextStyle(
    //               color: AppColors.whiteColor,
    //               fontWeight: FontWeight.w400,
    //               fontSize: getWidth(24.0),
    //             ),
    //           ),
    //           Text(
    //             '2 000.00',
    //             style: TextStyle(
    //               color: AppColors.whiteColor,
    //               fontWeight: FontWeight.w400,
    //               fontSize: getWidth(24.0),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         margin: EdgeInsets.only(top: getHeight(15), left: getWidth(255)),
    //         height: getHeight(18),
    //         width: getWidth(60),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             bottomRight: Radius.circular(getHeight(10)),
    //             topLeft: Radius.circular(getHeight(10)),
    //           ),
    //           color: AppColors.drawerBgColor,
    //         ),
    //         child: Text(
    //           "Основная",
    //           style: TextStyle(
    //             color: AppColors.whiteColor,
    //             fontSize: getHeight(8),
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

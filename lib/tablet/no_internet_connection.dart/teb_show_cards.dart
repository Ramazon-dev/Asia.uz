import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabShowCards extends StatelessWidget {
  const TabShowCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: getHeight(100),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.black,
            height: getHeight(40),
            width: getWidth(60),
          ).only(left: getWidth(15)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: getHeight(60),
                left: getWidth(134),
                right: getWidth(134),
                bottom: getHeight(40)),
            padding: EdgeInsets.only(
              top: getHeight(70),
              left: getWidth(70),
              right: getWidth(70),
            ),
            height: getHeight(650),
            width: getWidth(567),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getHeight(20)),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(getHeight(13)),
                  height: getHeight(375),
                  width: getWidth(425),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.unselectedColor,
                  ),
                  child: QrCodeCreator(
                    text: GetStorage().read("qrcode"),
                    color: AppColors.transparentColor,
                    size: getHeight(398),
                  ),
                ).only(bottom: getHeight(50)),
                Text(
                  "???????????????? QR-?????? ??????????????. ???????????????????????? ?????????? ?? ???????????????? ?? ?????????? ???????????????????? - 200 000 ??????????????."
                      .tr(),
                  style: TextStyle(
                    fontSize: getHeight(20),
                    fontWeight: FontWeight.w400,
                    color: AppColors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: getHeight(410),
            width: getWidth(834),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(getHeight(15)),
                  topLeft: Radius.circular(getHeight(15))),
              color: Colors.white,
            ),
            child: Column(
              children: [
                MyTextWidget(
                  text: "?????? ?????????? ???????????????????????? ?????? ???????????? ?? ???????????????????? ??????????????"
                      .tr(),
                  fontSize: getHeight(24),
                ).symmetric(vertical: getHeight(25), horizontal: getWidth(80)),
                const TabCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

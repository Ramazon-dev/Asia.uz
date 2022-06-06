import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/cards/widgets/card_widget.dart';
import 'package:asia_uz/screens/home/qrcode/qr_code.dart';
import 'package:flutter/material.dart';

class ShowCards extends StatelessWidget {
  const ShowCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(
            "assets/icons/arrow_back.png",
            color: AppColors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: getWidth(20), right: getWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(25),
              vertical: getHeight(20),
            ),
            height: getHeight(400),
            width: getWidth(335),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getHeight(15)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(getHeight(3)),
                  height: getHeight(280),
                  width: getWidth(285),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.unselectedColor,
                  ),
                  child: QrCodeCreator(
                    text: "",
                    color: AppColors.transparentColor,
                    size: getHeight(285),
                  ),
                ).only(bottom: getHeight(10)),
                Text(
                  """Покажите QR-код кассиру.
Максимальная сумма к списанию 
с карты лояльности - 200 000 бонусов.""",
                  style: TextStyle(
                    fontSize: getHeight(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).only(bottom: getHeight(12)),
          Container(
            height: getHeight(310),
            width: getWidth(375),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(getHeight(15)),
                  topLeft: Radius.circular(getHeight(15))),
              color: Colors.white,
            ),
            child: Column(
              children: [
                MyTextWidget(
                  text: """Эти карты используются для оплаты 
и начисления бонусов""",
                ).symmetric(vertical: getHeight(32), horizontal: getWidth(31)),
                const CardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

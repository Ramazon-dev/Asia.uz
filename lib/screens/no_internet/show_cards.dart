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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: getHeight(50),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: getWidth(20), right: getWidth(20), top: getHeight(71)),
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getHeight(3)),
                    height: getHeight(285),
                    width: getWidth(285),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.unselectedColor,
                    ),
                    child: QrCodeCreator(
                      text: GetStorage().read("qrcode"),
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
            ).only(bottom: getHeight(20)),
            // const Spacer(),
            Container(
              height: getHeight(315),
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
                    text:
                        """Эти карты используются для оплаты 
      и начисления бонусов""",
                  ).symmetric(
                      vertical: getHeight(20), horizontal: getWidth(31)),
                  const CardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

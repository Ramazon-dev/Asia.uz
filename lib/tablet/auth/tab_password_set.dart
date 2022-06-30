import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabPasswordSet extends StatelessWidget {
  TabPasswordSet({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        appbarHeihgt: getHeight(120),
        iconSize: getHeight(50),
      ),
      body: SingleChildScrollView(
        child: Container(
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
            top: getHeight(390),
            left: getWidth(180),
            right: getWidth(180),
          ),
          child: Column(
            children: [
              MyTextWidget(
                text: 'Установите PIN-код'.tr(),
                fontSize: getHeight(30),
              ).only(bottom: getHeight(50)),
              PinFieldAutoFill(
                codeLength: 4,
                controller: controller,
                decoration: BoxLooseDecoration(
                  strokeWidth: getWidth(3),
                  textStyle: TextStyle(
                    fontSize: getHeight(40),
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  strokeColorBuilder: const FixedColorBuilder(
                    AppColors.teal,
                  ),
                  radius: Radius.circular(getHeight(20)),
                ),
                currentCode: code,
                onCodeChanged: (code) async {
                  if (code!.length == 4) {
                    isActive = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TabReturnPassword(text: controller.text),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

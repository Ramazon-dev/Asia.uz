import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_padding/easy_padding.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsField extends StatelessWidget {
  String text;

  SmsField({
    Key? key,
    required this.text,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: AppColors.unselectedColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getHeight(80)),
          child: Column(
            children: [
              MyTextWidget(
                text: 'Мы отправили вам СМС ',
              ),
              MyTextWidget(
                text: "На номер +998 $text ",
                fontSize: getHeight(12),
                fontWeight: FontWeight.w400,
                textColor: AppColors.teal,
              ).only(
                top: getHeight(15),
                bottom: getHeight(50),
              ),
              PinFieldAutoFill(
                codeLength: 4,
                // autoFocus: true,
                controller: controller,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: const FixedColorBuilder(
                    AppColors.textFormFieldColor,
                  ),
                  radius: Radius.circular(getHeight(10)),
                ),
                currentCode: code,
                onCodeSubmitted: (code) async {
                  if (code.length == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  }
                },
                onCodeChanged: (code) async {
                  if (code!.length == 4) {
                    isActive = true;
                  }
                },
              ).only(bottom: getHeight(70)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Отправить код повторно",
                ),
              ).only(bottom: getHeight(200)),
              MyElevatedButton(
                primaryColor: AppColors.transparentColor,
                text: 'Войти'.tr(),
                onPressed: () {
                  isActive == true
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        )
                      : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

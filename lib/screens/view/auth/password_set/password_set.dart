import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/password_set/return_password.dart';
import 'package:flutter/material.dart';

class PasswordSet extends StatelessWidget {


  
  PasswordSet({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: [
              MyTextWidget(text: 'Установите PIN-код')
                  .only(bottom: getHeight(50)),
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
                        builder: (context) =>
                            ReturnPassword(text: controller.text),
                      ),
                    );
                  }
                },
                onCodeChanged: (code) async {
                  if (code!.length == 4) {
                    isActive = true;
                  }
                },
              ).only(bottom: getHeight(200)),
              MyElevatedButton(
                primaryColor: AppColors.transparentColor,
                text: 'Войти'.tr(),
                onPressed: () {
                  isActive == true
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReturnPassword(text: controller.text),
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

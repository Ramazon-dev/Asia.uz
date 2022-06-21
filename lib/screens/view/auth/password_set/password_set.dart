import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/no_internet/no_connection.dart';
import 'package:asia_uz/screens/view/auth/password_set/return_password.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PasswordSet extends StatelessWidget {
  PasswordSet({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            // color: Colors.yellow,
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(
            top: getHeight(183),
            left: getWidth(75),
            right: getWidth(75),
          ),
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
                    AppColors.teal,
                  ),
                  radius: Radius.circular(getHeight(10)),
                ),
                currentCode: code,
                onCodeChanged: (code) async {
                  if (code!.length == 4) {
                    isActive = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReturnPassword(text: controller.text),
                      ),
                    );
                  }
                },
              ).only(bottom: getHeight(250)),
              // MyElevatedButton(
              //   textColor: AppColors.whiteColor,
              //   primaryColor: AppColors.orangeColor,
              //   text: 'Войти'.tr(),
              //   onPressed: () {
              //     isActive == true
              //         ? Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   ReturnPassword(text: controller.text),
              //             ),
              //           )
              //         : null;
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

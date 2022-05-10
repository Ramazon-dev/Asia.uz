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
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(),
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
            top: getHeight(143),
            left: getWidth(80),
            right: getWidth(80),
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
                // onCodeSubmitted: (code) async {
                //   if (code.length == 4) {

                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             ReturnPassword(text: controller.text),
                //       ),
                //     );
                //   }
                // },
                onCodeChanged: (code) async {
                  if (code!.length == 4) {
                    isActive = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReturnPassword(text: controller.text)));
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

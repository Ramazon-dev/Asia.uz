import 'package:asia_uz/tablet/auth/tab_touch_id.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabReturnPassword extends StatefulWidget {
  String text;
  TabReturnPassword({Key? key, required this.text}) : super(key: key);

  @override
  State<TabReturnPassword> createState() => _TabReturnPasswordState();
}

class _TabReturnPasswordState extends State<TabReturnPassword> {
  TextEditingController controller = TextEditingController();

  String code = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBarWidget(
      //   appbarHeihgt: getHeight(120),
      //   iconSize: getHeight(25),
      // ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextWidget(
                text: 'Повторите свой PIN-код'.tr(),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                fontSize: getHeight(30),
              ).only(bottom: getHeight(50)),
              PinFieldAutoFill(
                autoFocus: true,
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
                onCodeSubmitted: (code) async {
                  if (code.length == 4 && widget.text == controller.text) {
                    GetStorage().write("password", controller.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabTouchIDPage(),
                      ),
                    );
                  }
                },
                onCodeChanged: (code) async {
                  if (code!.length == 4 && widget.text == controller.text) {
                    GetStorage().write("password", controller.text);

                    hideKeyboard(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabTouchIDPage(),
                      ),
                    );
                  }
                },
              ).only(bottom: getHeight(200)),
              // ElevatedButton(
              // MyElevatedButton(
              //   primaryColor: AppColors.transparentColor,
              //   text: 'Войти'.tr(),
              //   onPressed: () {
              //     isActive == true && text == controller.text
              //         ? Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => MainPage(),
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

  void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

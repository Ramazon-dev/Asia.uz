import 'package:asia_uz/service/api/get/loyality_cards_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class CheckPassword extends StatefulWidget {
  String text;
  CheckPassword({Key? key, required this.text}) : super(key: key);

  @override
  State<CheckPassword> createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  TextEditingController controller = TextEditingController();

  String code = '';

  bool isActive = false;
  bool first = true;

  isAuthenticated(BuildContext context) async {
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      debugPrint("auth localization ishladi");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (first) {
      isAuthenticated(context);
      first = false;
    }

    // isAuthenticated(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: const AppBarWidget(),
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
            top: getHeight(135),
            left: getWidth(75),
            right: getWidth(75),
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/biometric.png",
              ),
              MyTextWidget(
                text:
                    'Введите PIN-код или удерживайте палец на сенсоре для входа в приложение'
                        .tr(),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ).only(bottom: getHeight(24), top: getHeight(24)),
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
                onCodeSubmitted: (code) async {
                  if (code.length == 4 && widget.text == controller.text) {
                    GetStorage().write("password", controller.text);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  }
                },
                onCodeChanged: (code) async {
                  if (code!.length == 4 && widget.text == controller.text) {
                    GetStorage().write("password", controller.text);

                    hideKeyboard(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ).only(bottom: getHeight(200)),
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

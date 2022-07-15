import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabCheckPassword extends StatefulWidget {
  String text;
  TabCheckPassword({Key? key, required this.text}) : super(key: key);

  @override
  State<TabCheckPassword> createState() => _TabCheckPasswordState();
}

class _TabCheckPasswordState extends State<TabCheckPassword> {
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
          builder: (context) => TabMainPage(),
        ),
        (route) => false,
      );
    }
  }

  // @override
  // void initState() {
  //   if (first) {
  //     isAuthenticated(context);
  //     first = false;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    GetStorage().read("touchid") == "true"
        ? first == true
            ? {
                isAuthenticated(context),
                first = false,
              }
            : first = false
        : null;
    debugPrint("touchid: ${GetStorage().read("touchid")}");

    // isAuthenticated(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
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
            top: getHeight(215),
            left: getWidth(180),
            right: getWidth(180),
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
                fontSize: 32,
                textAlign: TextAlign.center,
              ).only(bottom: getHeight(24), top: getHeight(24)),
              PinFieldAutoFill(
                codeLength: 4,
                autoFocus: true,
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

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabMainPage(),
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
                        builder: (context) => TabMainPage(),
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

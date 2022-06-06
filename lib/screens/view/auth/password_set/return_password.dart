import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/profile/profile_page.dart';
import 'package:asia_uz/screens/shop/local_auth_api.dart';
import 'package:flutter/material.dart';

class ReturnPassword extends StatelessWidget {
  String text;
  ReturnPassword({Key? key, required this.text}) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;
  isAuthenticated(BuildContext context) async {
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      debugPrint("auth localization ishladi");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    isAuthenticated(context);
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
            top: getHeight(135),
            left: getWidth(80),
            right: getWidth(80),
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/biometric.png",
              ),
              MyTextWidget(
                text:
                    'Введите PIN-код или удерживайте палец на сенсоре для входа в приложение',
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
                  if (code.length == 4 && text == controller.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  }
                },
                onCodeChanged: (code) async {
                  if (code!.length == 4 && text == controller.text) {
                    hideKeyboard(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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

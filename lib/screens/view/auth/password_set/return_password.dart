import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/shop/local_auth_api.dart';
import 'package:flutter/material.dart';

class ReturnPassword extends StatelessWidget {
  String text;
  ReturnPassword({Key? key, required this.text}) : super(key: key);
  TextEditingController controller = TextEditingController();
  String code = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: [
              MyTextWidget(text: 'Повторите свой PIN-код')
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
                  if (code!.length == 4) {
                    isActive = true;
                  }
                },
              ).only(bottom: getHeight(200)),
              ElevatedButton(
                child: const Text(
                  'Authenticate',
                ),
                onPressed: () async {
                  final isAuthenticated = await LocalAuthApi.authenticate();
                  if (isAuthenticated) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  }
                },
              ),
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
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class ReturnPassword extends StatefulWidget {
  String text;
  ReturnPassword({Key? key, required this.text}) : super(key: key);

  @override
  State<ReturnPassword> createState() => _ReturnPasswordState();
}

class _ReturnPasswordState extends State<ReturnPassword> {
  TextEditingController controller = TextEditingController();
  String code = '';
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bu page da birinchi kiritilgan passwordni qayta kiritadi
    // to'gri kiritganidan kegin kegingi page ga otadi
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
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
            top: getHeight(183),
            left: getWidth(75),
            right: getWidth(75),
          ),
          child: Column(
            children: [
              MyTextWidget(
                text: 'Повторите свой PIN-код'.tr(),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ).only(bottom: getHeight(24), top: getHeight(24)),
              PinFieldAutoFill(
                codeLength: 4,
                autoFocus: true,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  }
                },
                onCodeChanged: (code) async {
                  // shu joyda password tog'ri kiritganini tekshiriladi
                  if (code!.length == 4 && widget.text == controller.text) {
                    GetStorage().write("password", controller.text);

                    hideKeyboard(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
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

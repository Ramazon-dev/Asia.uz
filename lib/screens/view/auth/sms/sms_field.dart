import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:asia_uz/cubit/verify_code_cubit/verify_code_state.dart';
import 'package:asia_uz/screens/view/auth/password_set/password_set.dart';
import 'package:flutter/material.dart';

class SmsField extends StatelessWidget {
  String text;

  SmsField({Key? key, required this.text}) : super(key: key);
  TextEditingController smsController = TextEditingController();
  final _validateKey = GlobalKey<FormState>();
  String code = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => VerifyCodeCubit(_validateKey, smsController),
      child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is VerifyCodeInitial) {
            return buildScaffold(context, state);
          } else {
            final error = state as VerifyCodeError;
            return Center(
              child: Text(error.errorMessage),
            );
          }
        },
      ),
    );
  }

  buildScaffold(BuildContext context, VerifyCodeState state) {
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
                controller: smsController,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: const FixedColorBuilder(
                    AppColors.textFormFieldColor,
                  ),
                  radius: Radius.circular(getHeight(10)),
                ),
                currentCode: code,
                onCodeSubmitted: (code) async {
                  if (code.length == 4) {
                    hideKeyboard(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordSet(),
                      ),
                    );
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
                            builder: (context) => MainPage(),
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

  void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

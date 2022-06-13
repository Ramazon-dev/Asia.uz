import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:asia_uz/screens/view/auth/password_set/password_set.dart';
import 'package:asia_uz/service/api/post/verify_code_service.dart';
import 'package:flutter/material.dart';

class SmsField extends StatefulWidget {
  String text;

  SmsField({Key? key, required this.text}) : super(key: key);

  @override
  State<SmsField> createState() => _SmsFieldState();
}

class _SmsFieldState extends State<SmsField> {
  TextEditingController smsController = TextEditingController();

  final _validateKey = GlobalKey<FormState>();

  String code = '';

  bool isload = false;

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
      extendBodyBehindAppBar: true,
      // backgroundColor: AppColors.unselectedColor,
      appBar:  AppBarWidget(),
      body: isload == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                  left: getWidth(75),
                  right: getWidth(75),
                ),
                child: Column(
                  children: [
                    MyTextWidget(
                      text: 'Мы отправили вам СМС ',
                    ),
                    MyTextWidget(
                      text: "На номер +998 ${widget.text} ",
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
                          AppColors.teal,
                        ),
                        radius: Radius.circular(getHeight(10)),
                      ),
                      currentCode: code,
                      // onCodeSubmitted: (code) async {
                      //   if (code.length == 4) {
                      //     hideKeyboard(context);
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => PasswordSet(),
                      //       ),
                      //     );
                      //   }
                      // },
                      onCodeChanged: (code) async {
                        if (code!.length == 4) {
                          isload = true;
                          setState(() {});
                          hideKeyboard(context);
                          // context.read<VerifyCodeCubit>().onTab();
                          await VerifyCodeService.verifyCodeService(
                                    int.parse(smsController.text),
                                    GetStorage().read('telNumber'),
                                  ) ==
                                  null
                              ? await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PasswordSet(),
                                  ),
                                )
                              : null;
                          isload = false;
                        }
                      },
                    ).only(bottom: getHeight(70)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Отправить код повторно",
                        style: TextStyle(
                          color: AppColors.drawerTextColor,
                        ),
                      ),
                    ),
                    // MyElevatedButton(
                    //   primaryColor: AppColors.orangeColor,
                    //   textColor: AppColors.whiteColor,
                    //   text: 'Войти'.tr(),
                    //   onPressed: () {
                    //     isActive == true
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

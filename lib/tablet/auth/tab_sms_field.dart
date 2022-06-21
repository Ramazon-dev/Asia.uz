import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:asia_uz/screens/view/auth/password_set/password_set.dart';
import 'package:asia_uz/service/api/post/verify_code_service.dart';
import 'package:asia_uz/tablet/auth/tab_password_set.dart';
import 'package:asia_uz/tablet/no_internet_connection.dart/tab_nointernet.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class TabSmsField extends StatefulWidget {
  String text;

  TabSmsField({Key? key, required this.text}) : super(key: key);

  @override
  State<TabSmsField> createState() => _TabSmsFieldState();
}

class _TabSmsFieldState extends State<TabSmsField> {
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
      appBar: AppBarWidget(),
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
                  top: getHeight(330),
                  left: getWidth(180),
                  right: getWidth(175),
                ),
                child: Column(
                  children: [
                    MyTextWidget(
                      fontSize: getHeight(30),
                      text: 'Мы отправили вам СМС ',
                    ),

                    MyTextWidget(
                      text: "На номер +998 ${widget.text} ",
                      fontSize: getHeight(20),
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
                        strokeWidth: getWidth(3),
                        textStyle: TextStyle(
                            fontSize: getHeight(40),
                            color: AppColors.black,
                            fontWeight: FontWeight.w300),
                        strokeColorBuilder: const FixedColorBuilder(
                          AppColors.teal,
                        ),
                        radius: Radius.circular(getHeight(20)),
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
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          if (hasInternet) {
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
                                      builder: (context) => TabPasswordSet(),
                                    ),
                                  )
                                : null;
                            isload = false;
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TabNoConnectionPage(),
                              ),
                            );
                          }
                        }
                      },
                    ).only(bottom: getHeight(103)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Отправить код повторно",
                        style: TextStyle(
                          fontSize: getHeight(20),
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

import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

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
  String platform = Platform.operatingSystem;

  @override
  Widget build(BuildContext context) {
    GetStorage().write("platform", platform);
    // bu page da foydalanuvchiga jonatilgan sms code ni kiritadi
    SizeConfig().init(context);
    return buildScaffold(context);
    // return BlocProvider(
    //   create: (context) => VerifyCodeCubit(_validateKey, smsController),
    //   child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       if (state is VerifyCodeInitial) {
    //         return buildScaffold(context, state);
    //       } else {
    //         final error = state as VerifyCodeError;
    //         return Center(
    //           child: Text(error.errorMessage),
    //         );
    //       }
    //     },
    //   ),
    // );
  }

  buildScaffold(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: AppColors.unselectedColor,
      appBar: AppBarWidget(),
      body: isload == true
          ? Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                color: AppColors.black,
                fit: BoxFit.cover,
                height: getHeight(70),
              ),
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
                      fontWeight: FontWeight.w500,
                      text: 'Мы отправили вам СМС'.tr(),
                    ),
                    MyTextWidget(
                      text: "На номер".tr() + " +998 ${widget.text}",
                      fontSize: getHeight(12),
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.teal,
                    ).only(
                      top: getHeight(15),
                      bottom: getHeight(50),
                    ),
                    PinFieldAutoFill(
                      codeLength: 4,
                      autoFocus: true,
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
                      onCodeSubmitted: (code) async {
                        debugPrint("change boldi");
                        if (code.length == 4) {
                          debugPrint("lenth 4 ta boldi");
                          isload = true;
                          setState(() {});
                          hideKeyboard(context);
                          // context.read<VerifyCodeCubit>().onTab();
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          if (hasInternet) {
                            debugPrint("internet ishlavotti");
                            String verify =
                                await VerifyCodeService.verifyCodeService(
                              int.parse(smsController.text),
                              GetStorage().read('telNumber'),
                            );
                            //  agar foydalanuvchi shu raqamdan oldin ro'yxatdan o'tgan bolsa
                            // asosiy page ga jo'natiladi
                            // aks xolda ro'yxatdan o'tishda davom etiladi
                            if (verify == "false") {
                              GetStorage().write("isverified", verify);
                              debugPrint("verify false chiqdi");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PasswordSet(),
                                ),
                              );
                            } else if (verify == "true") {
                              GetStorage().write("isverified", verify);
                              debugPrint("verify true chiqdi");
                              // agar foydalanuvchi oldin shu kiritilgan raqamdan
                              // ro'yxatdan o'tgan bo'lsa unda foydalanuvchi malumotlarini
                              // olish uchun mana shu api ga zapros jonatiladi
                              DevicesService.devicesService();
                              await LoyalityCardsService
                                      .getLoyalityCardsService()
                                  .then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PasswordSet(),
                                    ),
                                  );
                                },
                              );
                            } else if (verify == "null") {
                              debugPrint("verify null chiqdi");
                              debugPrint("if nul ga kirdik");
                              isload = false;
                              final snackBar = SnackBar(
                                // duration: const Duration(milliseconds: 500),
                                content: const Text('code xato kiritildi'),
                                backgroundColor: (Colors.black),
                                action: SnackBarAction(
                                  label: 'dismiss',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              setState(() {});
                            }
                            debugPrint("umuman if else dan tashqarida");
                            setState(() {
                              isload = false;
                            });
                            // showModalBottomSheet(
                            //   context: context,
                            //   builder: (context) => Container(),
                            // );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NoConnectionPage(),
                              ),
                            );
                          }
                          isload = false;
                          setState(() {});
                        }
                      },
                      // onCodeChanged: (code) async {},
                    ).only(bottom: getHeight(70)),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/reset.png"),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Отправить код повторно".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getWidth(12),
                                color: AppColors.drawerTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
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

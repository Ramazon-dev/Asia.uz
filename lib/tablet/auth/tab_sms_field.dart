import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

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
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        debugPrint(message.notification!.body);
        debugPrint(message.notification!.title);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      debugPrint("route from message: $routeFromMessage");
      Navigator.pushNamed(context, routeFromMessage);
    });
    FirebaseMessaging.instance.getToken().then(
      (token) {
        debugPrint("firebase messaging token: $token");
        String? tak = token;
        fcmToken = token;
        // final snackBar = SnackBar(
        //   // duration: const Duration(milliseconds: 500),
        //   content: Text(token!),
        //   backgroundColor: (Colors.cyan),
        //   action: SnackBarAction(
        //     label: 'dismiss',
        //     onPressed: () {},
        //   ),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // fcmToken = token;
        debugPrint("firebase messaging token: $tak");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return buildScaffold(context);
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
                  top: getHeight(330),
                  left: getWidth(180),
                  right: getWidth(175),
                ),
                child: Column(
                  children: [
                    MyTextWidget(
                      fontSize: getHeight(30),
                      text: 'Мы отправили вам СМС'.tr(),
                    ),
                    MyTextWidget(
                      text: "На номер".tr() + "+998 ${widget.text} ",
                      fontSize: getHeight(20),
                      fontWeight: FontWeight.w400,
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
                      onCodeChanged: (code) async {
                        debugPrint("change boldi");
                        if (code!.length == 4) {
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

                              debugPrint("fcmToke: $fcmToken");
                              DevicesService.devicesService(fcmToken ?? "");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabPasswordSet(),
                                ),
                              );
                            } else if (verify == "true") {
                              GetStorage().write("isverified", verify);
                              debugPrint("verify true chiqdi");
                              // agar foydalanuvchi oldin shu kiritilgan raqamdan
                              // ro'yxatdan o'tgan bo'lsa unda foydalanuvchi malumotlarini
                              // olish uchun mana shu api ga zapros jonatiladi
                              debugPrint("fcmToke: $fcmToken");
                              DevicesService.devicesService(fcmToken ?? "");

                              await LoyalityCardsService
                                      .getLoyalityCardsService()
                                  .then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabPasswordSet(),
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
                                builder: (context) =>
                                    const TabNoConnectionPage(),
                              ),
                            );
                          }
                          isload = false;
                          setState(() {});
                        } // if (code!.length == 4) {
                        //   isload = true;
                        //   setState(() {});
                        //   hideKeyboard(context);
                        //   bool hasInternet =
                        //       await InternetConnectionChecker().hasConnection;
                        //   debugPrint("has internet: $hasInternet");
                        //   if (hasInternet) {
                        //     bool verify =
                        //         await VerifyCodeService.verifyCodeService(
                        //       int.parse(smsController.text),
                        //       GetStorage().read('telNumber'),
                        //     );
                        //     if (verify == false) {
                        //       await Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => TabPasswordSet(),
                        //         ),
                        //       );
                        //     } else if (verify == true) {
                        //       DevicesService.devicesService("");
                        //       await LoyalityCardsService
                        //               .getLoyalityCardsService()
                        //           .then(
                        //         (value) {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => TabMainPage(),
                        //             ),
                        //           );
                        //         },
                        //       );
                        //     } else {
                        //       isload = false;
                        //       setState(() {});
                        //       final snackBar = SnackBar(
                        //         content: const Text('Parol notori kiritildi'),
                        //         action: SnackBarAction(
                        //           label: 'Undo',
                        //           onPressed: () {},
                        //         ),
                        //       );
                        //     }
                        //     isload = false;
                        //   } else {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>
                        //             const TabNoConnectionPage(),
                        //       ),
                        //     );
                        //   }
                        // }
                      },
                    ).only(bottom: getHeight(103)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Отправить код повторно".tr(),
                        style: TextStyle(
                          fontSize: getHeight(20),
                          color: AppColors.drawerTextColor,
                        ),
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

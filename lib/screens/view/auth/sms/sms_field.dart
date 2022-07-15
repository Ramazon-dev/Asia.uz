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

  @override
  Widget build(BuildContext context) {
    // bu page da foydalanuvchiga jonatilgan sms code ni kiritadi
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
                  top: getHeight(143),
                  left: getWidth(75),
                  right: getWidth(75),
                ),
                child: Column(
                  children: [
                    MyTextWidget(
                      text: 'Мы отправили вам СМС'.tr(),
                    ),
                    MyTextWidget(
                      text: "На номер".tr() + "+998 ${widget.text}",
                      fontSize: getHeight(12),
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
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          if (hasInternet) {
                            bool verify =
                                await VerifyCodeService.verifyCodeService(
                              int.parse(smsController.text),
                              GetStorage().read('telNumber'),
                            );
                            //  agar foydalanuvchi shu raqamdan oldin ro'yxatdan o'tgan bolsa
                            // asosiy page ga jo'natiladi
                            // aks xolda ro'yxatdan o'tishda davom etiladi
                            if (verify == false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PasswordSet(),
                                ),
                              );
                            } else if (verify == true) {
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
                                      builder: (context) => MainPage(),
                                    ),
                                  );
                                },
                              );
                            } else if (verify == null) {
                              isload = false;
                              setState(() {});
                              final snackBar = SnackBar(
                                content: const Text('Parol notori kiritildi'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );
                            }
                            isload = false;
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NoConnectionPage(),
                              ),
                            );
                          }
                          isload = false;
                        }
                      },
                    ).only(bottom: getHeight(70)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Отправить код повторно".tr(),
                        style: const TextStyle(
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

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
          ? Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                color: AppColors.orange,
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
                        if (code!.length == 4) {
                          isload = true;
                          setState(() {});
                          hideKeyboard(context);
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          if (hasInternet) {
                            bool verify =
                                await VerifyCodeService.verifyCodeService(
                              int.parse(smsController.text),
                              GetStorage().read('telNumber'),
                            );
                            if (verify == false) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabPasswordSet(),
                                ),
                              );
                            } else if (verify == true) {
                              DevicesService.devicesService();
                              await LoyalityCardsService
                                      .getLoyalityCardsService()
                                  .then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabMainPage(),
                                    ),
                                  );
                                },
                              );
                            } else {
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

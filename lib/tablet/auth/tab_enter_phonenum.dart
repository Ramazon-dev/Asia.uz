import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabEnterPhoneNumberPage extends StatefulWidget {
  const TabEnterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<TabEnterPhoneNumberPage> createState() =>
      _TabEnterPhoneNumberPageState();
}

class _TabEnterPhoneNumberPageState extends State<TabEnterPhoneNumberPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  String num = "+998";

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _formKey = GlobalKey<FormState>();

  bool isload = false;

  OnPressProvider? onPressProvider;

  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => AuthCubit(_formKey, _phoneNumberController),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthInitial) {
            return buildScaffold(context, state);
          } else {
            final error = state as AuthError;
            return Center(
              child: Text(error.errorState),
            );
          }
        },
      ),
    );
  }

  void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  buildScaffold(BuildContext context, AuthState state) {
    return Scaffold(
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
                decoration: const BoxDecoration(
                  // color: Colors.yellow,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/background.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: getHeight(140.0)),
                        Container(
                          height: getHeight(330.0),
                          width: getWidth(425.0),
                          decoration: const BoxDecoration(
                            // color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ).only(bottom: getHeight(65.0)),
                        MyTextWidget(
                          text: '?????????????? ?????????? ????????????????'.tr(),
                          fontSize: getWidth(30.0),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: getHeight(35.0)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getWidth(147.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: getWidth(540.0),
                                child: MyTextWidget(
                                  text: '?????????? ????????????????'.tr(),
                                  fontSize: getWidth(16),
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.teal,
                                ),
                              ),
                              SizedBox(height: getHeight(25.0)),
                              SizedBox(
                                height: getHeight(65),
                                child: MyTextFormFiels(
                                  inputFormatters: [maskFormatter],
                                  controller: _phoneNumberController,
                                  obscureText: false,
                                  prefixIcon: Container(
                                    margin: EdgeInsets.only(
                                        left: getWidth(20),
                                        bottom: getHeight(5),
                                        top: getHeight(5)),
                                    alignment: Alignment.centerLeft,
                                    height: getHeight(43.0),
                                    width: getWidth(100.0),
                                    child: MyTextWidget(
                                      text: '+998',
                                      fontSize: 36,
                                      fontWeight: FontWeight.w400,
                                      textColor: AppColors.black,
                                    ),
                                  ),
                                  inputTextSize: 36,
                                  radius: getHeight(38),
                                  sideColor: AppColors.onPressColor,
                                  sideWidth: getWidth(2),
                                  onChanged: (value) {
                                    if ((value.replaceAll(' ', '').length ==
                                        9)) {
                                      hideKeyboard(context);
                                    }
                                  },
                                  validator: (v) {
                                    return v!.replaceAll(' ', '').length == 9
                                        ? null
                                        : '?????????? ???????????????? ???? ????????????'.tr();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getHeight(65.0)),
                        MyElevatedButton(
                          radius: getHeight(30),
                          height: 83,
                          width: 473,
                          child: isload == true
                              ? Center(
                                  child: Image.asset(
                                    "assets/images/loading_indicator.gif",
                                    fit: BoxFit.cover,
                                    height: getHeight(40),
                                  ),
                                )
                              : null,
                          text: '????????????????????'.tr(),
                          textSize: getHeight(32),
                          onPressed: isload == true
                              ? () {
                                  debugPrint(
                                      "Isload true and button can't be touched");
                                }
                              : () async {
                                  bool hasInternet =
                                      await InternetConnectionChecker()
                                          .hasConnection;
                                  debugPrint("has internet: $hasInternet");
                                  // agar telefon raqam toliq kiritilmagan bolsa validator ishga tushadi
                                  if (_formKey.currentState!.validate()) {
                                    // validatsiyadan to'g'ri o'tganidan kegin internet
                                    //ishlab turgani uchun tekshiriladi
                                    if (hasInternet) {
                                      // internet ishlab turgan bo'lsa api ga zapros jonatiladi
                                      // apidan javob kelganidan kegin kegingi page ga otadi
                                      isload = true;
                                      setState(() {});
                                      debugPrint(
                                          "ttttttttttttttttt : ${_phoneNumberController.text.replaceAll(' ', '')}");
                                      setState(() {});
                                      debugPrint('on tab');
                                      await GetStorage().write('telNumber',
                                          "+998${_phoneNumberController.text.replaceAll(' ', '')}");
                                      await VerifyNumberService
                                                  .verifyNumberService(
                                                      _phoneNumberController
                                                          .text) ==
                                              null
                                          ? await next(context)
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
                          primaryColor: AppColors.orangeColor,
                          textColor: AppColors.whiteColor,
                          sideColor: AppColors.transparentColor,
                        ),
                        SizedBox(height: getHeight(140)),
                        RichTextWidget(
                          textsize: 16,
                          width: 400,
                        ),
                        SizedBox(height: getHeight(60)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  next(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TabSmsField(text: _phoneNumberController.text),
      ),
    );
  }
}

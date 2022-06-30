import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class EnterPhoneNumberPage extends StatefulWidget {
  const EnterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberPage> createState() => _EnterPhoneNumberPageState();
}

class _EnterPhoneNumberPageState extends State<EnterPhoneNumberPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  String num = "+998";

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _formKey = GlobalKey<FormState>();

  bool isload = false;
  var sasa;

  OnPressProvider? onPressProvider;

  @override
  Widget build(BuildContext context) {
    // bu page da foydalanuvchi raqam kiritadi
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
          ? const Center(
              child: CircularProgressIndicator(),
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
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: getHeight(133.0)),
                        Container(
                          height: getHeight(188.0),
                          width: getWidth(225.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.png',
                              ),
                            ),
                          ),
                        ).only(bottom: getHeight(56.0)),
                        MyTextWidget(
                          text: 'Введите номер телефона'.tr(),
                          fontSize: getWidth(16.0),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: getHeight(33.0)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getWidth(25.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: getWidth(320.0),
                                child: MyTextWidget(
                                  text: 'Номер телефона'.tr(),
                                  fontSize: getWidth(9),
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.teal,
                                ),
                              ),
                              SizedBox(height: getHeight(6.0)),
                              SizedBox(
                                height: getHeight(45),
                                child: MyTextFormFiels(
                                  inputFormatters: [maskFormatter],
                                  controller: _phoneNumberController,
                                  obscureText: false,
                                  prefixIcon: Container(
                                    // color: Colors.yellow,
                                    margin: EdgeInsets.only(
                                        left: getHeight(6),
                                        bottom: getHeight(2)),
                                    alignment: Alignment.centerLeft,
                                    height: getHeight(60.0),
                                    width: getWidth(42.0),
                                    child: MyTextWidget(
                                      text: '+998',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      textColor: AppColors.black,
                                    ),
                                  ),
                                  inputTextSize: 16,
                                  radius: getHeight(30),
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
                                        : 'Номер телефона не введен'.tr();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getHeight(34.0)),
                        MyElevatedButton(
                          radius: getHeight(15),
                          height: getHeight(50),
                          width: getWidth(285),
                          text: 'Продолжить'.tr(),
                          onPressed: () async {
                            bool hasInternet =
                                await InternetConnectionChecker().hasConnection;
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
                                await VerifyNumberService.verifyNumberService(
                                            _phoneNumberController.text) ==
                                        null
                                    ? await next(context)
                                    : null;
                                isload = false;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NoConnectionPage(),
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
                        RichTextWidget(),
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
        builder: (context) => SmsField(text: _phoneNumberController.text),
      ),
    );
  }
}

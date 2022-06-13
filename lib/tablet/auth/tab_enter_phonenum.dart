import 'package:asia_uz/service/api/post/verify_number_service.dart';
import 'package:asia_uz/tablet/auth/tab_sms_field.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabEnterPhoneNumberPage extends StatefulWidget {
  TabEnterPhoneNumberPage({Key? key}) : super(key: key);

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
  var sasa;

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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                // color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                  fit: BoxFit.contain,
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
                        text: 'Введите номер телефона',
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
                                text: 'Номер телефона',
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
                                  if ((value.replaceAll(' ', '').length == 9)) {
                                    hideKeyboard(context);
                                  }
                                },
                                validator: (v) {
                                  return v!.replaceAll(' ', '').length == 9
                                      ? null
                                      : 'Telefon raqam kiritilmadi';
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
                        text: 'Продолжить',
                        textSize: getHeight(32),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
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
                          }
                        },
                        primaryColor: AppColors.orangeColor,
                        textColor: AppColors.whiteColor,
                        sideColor: AppColors.transparentColor,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: getHeight(70.0),
                        width: getWidth(390.0),
                        // color: Colors.amberAccent,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getWidth(16.0),
                            ),
                            children: [
                              TextSpan(
                                text:
                                    ('Нажимая “Продолжить” вы соглашаетесь с\n условиями '),
                                style: TextStyle(
                                  fontSize: getWidth(16.0),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: ('Обработки персональных '),
                                style: TextStyle(
                                  fontSize: getWidth(16.0),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orangeColor,
                                ),
                              ),
                              TextSpan(
                                text: ('данных и\n'),
                                style: TextStyle(
                                  fontSize: getWidth(16.0),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: (' Публичной аферты'),
                                style: TextStyle(
                                  fontSize: getWidth(16.0),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orangeColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

import 'package:asia_uz/service/api/post/verify_number_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  EnterPhoneNumberPage({Key? key}) : super(key: key);

  final TextEditingController _phoneNumberController = TextEditingController();
  String num = "+998";
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _formKey = GlobalKey<FormState>();

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
      body: Container(
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: getHeight(150.0)),
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
                  ),
                  SizedBox(height: getHeight(56.0)),
                  MyTextWidget(
                    text: 'Введите номер телефона',
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
                            text: 'Номер телефона',
                            fontSize: 9.0,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.teal,
                          ),
                        ),
                        SizedBox(height: getHeight(6.0)),
                        SizedBox(
                          height: 45,
                          child: MyTextFormFiels(
                            inputFormatters: [maskFormatter],
                            controller: _phoneNumberController,
                            obscureText: false,
                            prefixIcon: Container(
                              margin: EdgeInsets.only(
                                  left: getWidth(5.0), bottom: getHeight(2)),
                              alignment: Alignment.center,
                              height: getHeight(40.0),
                              width: getWidth(40.0),
                              child: MyTextWidget(
                                text: '+998',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                textColor: AppColors.black,
                              ),
                            ),
                            radius: 30.0,
                            sideColor: AppColors.onPressColor,
                            sideWidth: 2.0,
                            onChanged: (value) {
                              if ((value.replaceAll(' ', '').length == 9)) {
                                hideKeyboard(context);
                              }
                            },
                            validator: (v) =>
                                v!.isEmpty ? 'Telefon raqam kiritilmadi' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(34.0)),
                  MyElevatedButton(
                    height: getHeight(50),
                    width: getWidth(285),
                    text: 'Продолжить',
                    onPressed: () async {
                      debugPrint(
                          "ttttttttttttttttt : ${_phoneNumberController.text.replaceAll(' ', '')}");

                      debugPrint('on tab');
                      await GetStorage().write('telNumber',
                          "+998${_phoneNumberController.text.replaceAll(' ', '')}");
                      // context.read<AuthCubit>().login(int.parse(
                      //     _phoneNumberController.text.replaceAll(' ', '')));
                      await VerifyNumberService.verifyNumberService(
                          _phoneNumberController.text);
                      await next(context);
                      // context.read<AuthCubit>().clear();
                    },
                    primaryColor: AppColors.orangeColor,
                    textColor: AppColors.whiteColor,
                    sideColor: AppColors.transparentColor,
                  ),
                  SizedBox(height: getHeight(120.0)),
                  SizedBox(
                    height: getHeight(70.0),
                    width: getWidth(284.0),
                    // color: Colors.amberAccent,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: getWidth(12.0),
                        ),
                        children: [
                          TextSpan(
                            text:
                                ('Нажимая “Продолжить” вы соглашаетесь с\n условиями '),
                            style: TextStyle(
                              fontSize: getWidth(12.0),
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: ('Обработки персональных '),
                            style: TextStyle(
                              fontSize: getWidth(12.0),
                              fontWeight: FontWeight.w400,
                              color: AppColors.orangeColor,
                            ),
                          ),
                          TextSpan(
                            text: ('данных и\n'),
                            style: TextStyle(
                              fontSize: getWidth(12.0),
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: (' Публичной аферты'),
                            style: TextStyle(
                              fontSize: getWidth(12.0),
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

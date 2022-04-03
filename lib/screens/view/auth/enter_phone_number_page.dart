import 'package:asia_uz/core/widgets/my_text_form_fields.dart';
import 'package:asia_uz/screens/view/auth/sms/sms_field.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  EnterPhoneNumberPage({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
  String num = "+998";
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                fontSize: 16.0,
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
                    MyTextFormFiels(
                      inputFormatters: [maskFormatter],
                      controller: phoneNumberController,
                      obscureText: false,
                      prefixIcon: Container(
                        margin: EdgeInsets.only(
                          left: getWidth(5.0),
                        ),
                        alignment: Alignment.center,
                        height: getHeight(50.0),
                        width: getWidth(50.0),
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
                    )
                  ],
                ),
              ),
              SizedBox(height: getHeight(34.0)),
              MyElevatedButton(
                text: 'Продолжить',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SmsField(
                        text: phoneNumberController.text,
                      ),
                    ),
                  );
                },
                primaryColor: AppColors.transparentColor,
                sideColor: AppColors.unselectedColor,
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
                          color: AppColors.onPressColor,
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
                          color: AppColors.onPressColor,
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
    );
  }
}

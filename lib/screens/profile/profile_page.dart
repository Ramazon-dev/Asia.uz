import 'package:asia_uz/cubit/profile_cubit/profile_cubit.dart';
import 'package:asia_uz/service/api/post/customers_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import '../../core/components/view/my_app_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dataBirthController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _seminalPositionController =
      TextEditingController();
  final TextEditingController _employmentController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _homePhoneNumberController =
      TextEditingController();
  final TextEditingController _homeSecondPhoneNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notificationController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return buildScaffold(context);
    // return BlocProvider(
    //   create: (context) => ProfileCubit(
    //     _formKey,
    //     _firstNameController,
    //     _lastNameController,
    //     _dataBirthController,
    //     _phoneNumberController,
    //     _floorController,
    //     _seminalPositionController,
    //     _employmentController,
    //     _homePhoneNumberController,
    //     _homeSecondPhoneNumberController,
    //     _emailController,
    //     _notificationController,
    //     _languageController,
    //   ),
    //   child: BlocConsumer<ProfileCubit, ProfileState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       var _context = context.read<ProfileCubit>();
    //       if (state is ProfileInitial) {
    //         return buildScaffold(context, state, _context);
    //       } else {
    //         final error = state as ProfileError;
    //         return Center(
    //           child: Text(error.erroeMessange),
    //         );
    //       }
    //     },
    //   ),
    // );
  }

  back(context) {
    Navigator.pop(context);
  }

  String? pol;
  String? notifLang;
  buildScaffold(BuildContext context) {
    // _firstNameController.text = GetStorage().read("firstName") ?? "";
    // _lastNameController.text = GetStorage().read("lastName")?? "";
    // _dataBirthController.text = GetStorage().read("dateOfBirth")?? "";
    // pol = GetStorage().read("gender")?? "";
    // _phoneNumberController.text = GetStorage().read("phoneNumber")?? "";
    // _notificationController.text = GetStorage().read("notif")?? "";
    // notifLang = GetStorage().read("notifLang")?? "";
    // _seminalPositionController.text = GetStorage().read("pol")?? "";
    // _employmentController.text = GetStorage().read("zanyatost")?? "";
    // _homePhoneNumberController.text = GetStorage().read("homePhone")?? "";
    // _homeSecondPhoneNumberController.text = GetStorage().read("anotherPhone")?? "";
    // _emailController.text = GetStorage().read("email")?? "";
    // _languageController.text = GetStorage().read("lang")?? "";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.whiteColor,
        ),
        text: 'Профиль',
        action: SvgPicture.asset(SvgIcons.avatar),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(23.0),
              vertical: getHeight(6.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'Имя*',
                    labelText: 'Имя*',
                  ),
                  validator: (v) => v!.isEmpty ? 'Ism kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Фамилия*',
                    labelText: 'Фамилия*',
                  ),
                  validator: (v) => v!.isEmpty ? 'Familiya kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _dataBirthController,
                  decoration: const InputDecoration(
                    hintText: 'Дата рождения*',
                    labelText: 'Дата рождения*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Sana kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                DropdownButtonFormField(
                  hint: const Text("Gender"),
                  icon: Padding(
                    padding: EdgeInsets.only(right: getHeight(13)),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  onChanged: (String? v) {
                    pol = v;
                    debugPrint("gender: $v");
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: "male",
                      child: Text("male"),
                    ),
                    DropdownMenuItem(
                      value: "female",
                      child: Text("female"),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    // hintText: 'Мобильный телефон*',
                    prefixText: "+998 ",
                    prefixStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Мобильный телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Telefon raqam kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _notificationController,
                  decoration: const InputDecoration(
                    hintText: 'Способ получения уведомлений*',
                    labelText: 'Способ получения уведомлений*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                DropdownButtonFormField(
                  hint: const Text("Язык уведомлений"),
                  icon: Padding(
                    padding: EdgeInsets.only(right: getHeight(13)),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  onChanged: (String? v) {
                    notifLang = v;
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: "russian",
                      child: Text("russian"),
                    ),
                    DropdownMenuItem(
                      value: "o`zbek",
                      child: Text("o`zbek"),
                    ),
                    DropdownMenuItem(
                      value: "english",
                      child: Text("english"),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _floorController,
                  decoration: const InputDecoration(
                    hintText: 'Пол*',
                    labelText: 'Пол*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Jins kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _seminalPositionController,
                  decoration: const InputDecoration(
                    hintText: 'Семейное положение*',
                    labelText: 'Семейное положение*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Oilaviy sharoit kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _employmentController,
                  decoration: const InputDecoration(
                    hintText: 'Занятость*',
                    labelText: 'Занятость*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _homePhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Домашний телефон*',
                    labelText: 'Домашний телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Uy raqami kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _homeSecondPhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Дополнительный телефон*',
                    labelText: 'Дополнительный телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Qoshimcha raqam kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail*',
                    labelText: 'E-mail*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Email kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _languageController,
                  decoration: const InputDecoration(
                    hintText: 'Язык уведомлений*',
                    labelText: 'Язык уведомлений*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(25.0)),
                MyElevatedButton(
                  text: 'Сохранить',
                  onPressed: () async {
                    GetStorage().write("firstName", _firstNameController.text);
                    GetStorage().write("lastName", _lastNameController.text);
                    GetStorage()
                        .write("dateOfBirth", _dataBirthController.text);
                    GetStorage().write("gender", pol);
                    GetStorage().write(
                        "phoneNumber", "+998${_phoneNumberController.text}");
                    GetStorage().write("notif", _notificationController.text);
                    GetStorage().write("notifLang", notifLang);
                    GetStorage().write("pol", _seminalPositionController.text);
                    GetStorage().write("zanyatost", _employmentController.text);
                    GetStorage()
                        .write("homePhone", _homePhoneNumberController.text);
                    GetStorage().write(
                        "anotherPhone", _homeSecondPhoneNumberController.text);
                    GetStorage().write("email", _emailController.text);
                    GetStorage().write("lang", _languageController.text);
                    // _context.validateState();
                    // _context.clear();
                    debugPrint(
                        """
mobile_phone: ${_phoneNumberController.text}
firstname: ${_firstNameController.text},
lastNeme: ${_lastNameController.text},
dob: ${_dataBirthController.text},
gender: $pol,
maritalStatus: true,
occupation: occupation,
notificationPreference: "notificationPreference",
notificationLanguage: "notificationLanguage",

""");
                    await CustomersServices.cuspomersService(
                      phoneNumber: "+998${_phoneNumberController.text}",
                      dob: _dataBirthController.text,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      gender: pol ?? "male",
                      materialStatus: true,
                      notificationLanguage: notifLang ?? "russian",
                      notificationPreference: "sms",
                      occupation: "occupation",
                    );
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  height: 50.0,
                  // width: 161.0,
                  primaryColor: AppColors.transparentColor,
                  sideColor: AppColors.orangeColor,
                  radius: 15.0,
                  sideWidth: 2.0,
                ),
                SizedBox(height: getHeight(20.0)),
                SizedBox(
                  height: getHeight(70.0),
                  width: getWidth(334.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(13.0),
                      ),
                      children: [
                        TextSpan(
                          text: ("Нажимая “Продолжить” вы соглашаетесь с\n"),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("условиями "),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("Обработки персональных "),
                          style: TextStyle(
                            color: AppColors.onPressColor,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("данных,\n"),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("Программой лояльности и Публичной аферты"),
                          style: TextStyle(
                            color: AppColors.onPressColor,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getHeight(15.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

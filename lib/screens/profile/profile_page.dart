import 'package:asia_uz/cubit/profile_cubit/profile_cubit.dart';
import 'package:asia_uz/service/api/post/customers_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../core/components/view/my_app_bar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  String? birthday;
  bool isload = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return buildScaffold(context);
  }

  back(context) {
    Navigator.pop(context);
  }

  String? pol;

  String? notifLang;

  buildScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            "assets/icons/arrow_back.png",
            color: AppColors.whiteColor,
          ),
        ),
        text: 'Профиль',
        action: SvgPicture.asset(SvgIcons.avatar),
      ),
      body: isload == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                        validator: (v) =>
                            v!.isEmpty ? 'Familiya kiritilmadi' : null,
                      ),
                      SizedBox(height: getHeight(4.0)),
                      InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            maxTime: DateTime.now(),
                            onChanged: (datetime) {
                              debugPrint("changed: $datetime");
                            },
                            onConfirm: (datetime) {
                              birthday =
                                  "${datetime.day}/${datetime.month}/${datetime.year}";
                              debugPrint(datetime.toString());

                              debugPrint(birthday);
                              setState(() {});
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.ru,
                          );
                        },
                        child: Container(
                          // alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              // color: Colors.yellow,
                              border: Border(
                            bottom: BorderSide(
                              color: AppColors.black,
                              width: getWidth(0.5),
                            ),
                          )),
                          height: getHeight(50),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Дата рождения",
                                    style: TextStyle(
                                      fontSize: getHeight(14),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.bottomUnselectedColor,
                                    ),
                                  ),
                                  Text(
                                    birthday ?? "",
                                    style: TextStyle(
                                      fontSize: getHeight(16),
                                      // fontWeight: FontWeight.w500,
                                      // color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: getWidth(11)),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   onTap: () {

                      //   },
                      //   controller: _dataBirthController,
                      //   keyboardType: TextInputType.datetime,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Дата рождения*',
                      //     labelText: 'Дата рождения*',
                      //     suffixIcon: Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: AppColors.black,
                      //     ),
                      //   ),
                      //   validator: (v) => v!.isEmpty ? 'Sana kiritilmadi' : null,
                      // ),
                      SizedBox(height: getHeight(4.0)),
                      DropdownButtonFormField(
                        hint: const Text("Пол*"),
                        icon: Padding(
                          padding: EdgeInsets.only(right: getHeight(13)),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // value: "",
                        validator: (v) => v == null ? "Pol tanlanmadi" : null,
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
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          // hintText: 'Мобильный телефон*',
                          prefixText: "+998 ",
                          prefixStyle: TextStyle(
                            color: AppColors.black,
                            fontSize: getHeight(17),
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: 'Мобильный телефон*',
                          suffixIcon: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // validator: (v) =>
                        //     v!.isEmpty ? 'Telefon raqam kiritilmadi' : null,
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
                        validator: (v) => v == null ? "Till tanlanmadi" : null,
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
                      // TextFormField(
                      //   controller: _floorController,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Пол*',
                      //     labelText: 'Пол*',
                      //     suffixIcon: Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: AppColors.black,
                      //     ),
                      //   ),
                      //   validator: (v) => v!.isEmpty ? 'Jins kiritilmadi' : null,
                      // ),
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
                        // validator: (v) =>
                        //     v!.isEmpty ? 'Oilaviy sharoit kiritilmadi' : null,
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
                        // validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                      ),
                      SizedBox(height: getHeight(4.0)),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _homePhoneNumberController,
                        decoration: const InputDecoration(
                          hintText: 'Домашний телефон*',
                          labelText: 'Домашний телефон*',
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // validator: (v) => v!.isEmpty ? 'Uy raqami kiritilmadi' : null,
                      ),
                      SizedBox(height: getHeight(4.0)),
                      TextFormField(
                        controller: _homeSecondPhoneNumberController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          hintText: 'Дополнительный телефон*',
                          labelText: 'Дополнительный телефон*',
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // validator: (v) =>
                        //     v!.isEmpty ? 'Qoshimcha raqam kiritilmadi' : null,
                      ),
                      SizedBox(height: getHeight(4.0)),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail*',
                          labelText: 'E-mail*',
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // validator: (v) => v!.isEmpty ? 'Email kiritilmadi' : null,
                      ),
                      SizedBox(height: getHeight(4.0)),
                      SizedBox(height: getHeight(70.0)),
                      MyElevatedButton(
                        text: 'Сохранить',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            isload = true;
                            setState(() {});
                            await GetStorage()
                                .write("firstName", _firstNameController.text);
                            await GetStorage()
                                .write("lastName", _lastNameController.text);
                            await GetStorage().write("dateOfBirth", birthday);
                            await GetStorage().write("gender", pol);
                            await GetStorage().write("phoneNumber",
                                "+998${_phoneNumberController.text}");
                            await GetStorage()
                                .write("notif", _notificationController.text);
                            await GetStorage().write("notifLang", notifLang);
                            await GetStorage()
                                .write("pol", _seminalPositionController.text);
                            await GetStorage()
                                .write("zanyatost", _employmentController.text);
                            await GetStorage().write(
                                "homePhone", _homePhoneNumberController.text);
                            await GetStorage().write("anotherPhone",
                                _homeSecondPhoneNumberController.text);
                            await GetStorage()
                                .write("email", _emailController.text);
                            await GetStorage()
                                .write("lang", _languageController.text);
                            // _context.validateState();
                            // _context.clear();
                            debugPrint("""
mobile_phone: ${_phoneNumberController.text}
firstname: ${_firstNameController.text},
lastNeme: ${_lastNameController.text},
dob: $birthday,
gender: $pol,
maritalStatus: true,
occupation: occupation,
notificationPreference: "notificationPreference",
notificationLanguage: "notificationLanguage",
""");
                            await CustomersServices.cuspomersService(
                                      phoneNumber:
                                          "+998${_phoneNumberController.text}",
                                      dob: birthday!,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      gender: pol ?? "male",
                                      materialStatus: true,
                                      notificationLanguage:
                                          notifLang ?? "russian",
                                      notificationPreference: "sms",
                                      occupation: "occupation",
                                    ) !=
                                    null
                                ? await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()))
                                : null;
                            isload = false;
                          }
                        },
                        height: getHeight(50),
                        // width: 161.0,
                        primaryColor: AppColors.transparentColor,
                        sideColor: AppColors.orangeColor,
                        radius: getHeight(15),
                        sideWidth: getHeight(2),
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
                                text:
                                    ("Нажимая “Продолжить” вы соглашаетесь с\n"),
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
                                text:
                                    ("Программой лояльности и Публичной аферты"),
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
                      SizedBox(height: getHeight(40.0)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

import 'dart:io' show Platform;

import 'package:asia_uz/screens/about_us/about_us_page.dart';
import 'package:asia_uz/screens/no_internet/no_connection.dart';
import 'package:asia_uz/service/api/post/customers_service.dart';
import 'package:asia_uz/service/api/post/devices_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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

  final TextEditingController _homePhoneNumberController =
      TextEditingController();

  final TextEditingController _homeSecondPhoneNumberController =
      TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _notificationController = TextEditingController();

  final TextEditingController _languageController = TextEditingController();

  String? birthday;
  bool isload = false;

  String platform() {
    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else {
      platform = "IOS";
    }
    return platform;
  }

  @override
  Widget build(BuildContext context) {
    GetStorage().write("platform", platform());
    debugPrint(platform());
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
                          decoration: BoxDecoration(
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
                        validator: (v) => v == null ? "Pol tanlanmadi" : null,
                        onChanged: (String? v) {
                          pol = v;
                          debugPrint("gender: $v");
                        },
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "мужчина",
                            child: Text("мужчина"),
                          ),
                          DropdownMenuItem(
                            value: "женщина",
                            child: Text("женщина"),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(4.0)),
                      SizedBox(height: getHeight(4.0)),
                      DropdownButtonFormField(
                        hint: const Text(
                          "Семейное положение*",
                        ),
                        icon: Padding(
                          padding: EdgeInsets.only(right: getHeight(10)),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // value: "",
                        validator: (v) =>
                            v == null ? "Семейное положение* tanlanmadi" : null,
                        onChanged: (String? v) {
                          pol = v;
                          debugPrint("gender: $v");
                        },
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "женат/замужем",
                            child: Text(
                              "женат/замужем",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "холост/не замужем",
                            child: Text(
                              "холост/не замужем",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "разведен/разведена",
                            child: Text(
                              "разведен/разведена",
                            ),
                          ),
                        ],
                      ),
                      // TextFormField(
                      //   controller: _seminalPositionController,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Семейное положение*',
                      //     labelText: 'Семейное положение*',
                      //     suffixIcon: Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: AppColors.black,
                      //     ),
                      //   ),
                      // ),
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
                      ),
                      SizedBox(height: getHeight(4.0)),
                      SizedBox(height: getHeight(70.0)),
                      MyElevatedButton(
                        text: 'Сохранить',
                        onPressed: () async {
                          platform();
                          if (_formKey.currentState!.validate()) {
                            bool hasInternet =
                                await InternetConnectionChecker().hasConnection;
                            debugPrint("has internet: $hasInternet");
                            if (hasInternet) {
                              isload = true;
                              setState(() {});
                              GetStorage().write(
                                "firstName",
                                _firstNameController.text,
                              );
                              await CustomersServices.cuspomersService(
                                        platform: GetStorage().read("platform"),
                                        dob: birthday!,
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        gender: pol ?? "женщина",
                                        materialStatus: true,
                                        notificationLanguage:
                                            notifLang ?? "russian",
                                        notificationPreference: "sms",
                                        occupation: "occupation",
                                      ) !=
                                      null
                                  ? await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                      ),
                                      (route) => false,
                                    )
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AboutUsPage(),
                                      ),
                                    );
                              DevicesService.devicesService();
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NoConnectionPage(),
                                ),
                              );
                              isload = false;
                            }
                          }
                        },
                        height: getHeight(50),
                        // width: 161.0,
                        primaryColor: AppColors.transparentColor,
                        sideColor: AppColors.orangeColor,
                        radius: getHeight(15),
                        sideWidth: getHeight(2),
                      ),
                      SizedBox(height: getHeight(120.0)),
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

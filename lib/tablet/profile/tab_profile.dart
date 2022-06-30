import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabProfilePage extends StatefulWidget {
  const TabProfilePage({Key? key}) : super(key: key);

  @override
  State<TabProfilePage> createState() => _TabProfilePageState();
}

class _TabProfilePageState extends State<TabProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _employmentController = TextEditingController();

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
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            height: getHeight(20),
            width: getWidth(30),
          ),
        ),
        text: 'Профиль'.tr(),
        textSize: getHeight(30),
        action: SvgPicture.asset(SvgIcons.avatar),
      ),
      body: isload == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(40.0),
                  vertical: getHeight(6.0),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Имя*'.tr(),
                        labelText: 'Имя*'.tr(),
                      ),
                      validator: (v) => v!.isEmpty ? 'Ism kiritilmadi' : null,
                    ),
                    SizedBox(height: getHeight(4.0)),
                    TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Фамилия*'.tr(),
                        labelText: 'Фамилия*'.tr(),
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
                        padding: EdgeInsets.only(bottom: getHeight(5)),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            // color: Colors.yellow,
                            border: Border(
                          bottom: BorderSide(
                            color: AppColors.black,
                            width: getWidth(1),
                          ),
                        )),
                        height: getHeight(60),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Дата рождения*".tr(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.bottomUnselectedColor,
                                  ),
                                ),
                                Text(
                                  birthday ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: AppColors.black,
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
                    SizedBox(height: getHeight(15.0)),
                    DropdownButtonFormField(
                      hint: Text(
                        "Пол*".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                      icon: Padding(
                        padding: EdgeInsets.only(right: getHeight(10)),
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
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: "мужчина".tr(),
                          child: Text(
                            "мужчина".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "женщина".tr(),
                          child: Text(
                            "женщина".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(4.0)),
                    DropdownButtonFormField(
                      hint: Text(
                        "Семейное положение*".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: AppColors.black,
                        ),
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
                          v == null ? "Семейное положение не выбрано" : null,
                      onChanged: (String? v) {
                        pol = v;
                        debugPrint("gender: $v");
                      },
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: "женат/замужем".tr(),
                          child: Text(
                            "женат/замужем".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "холост/не замужем".tr(),
                          child: Text(
                            "холост/не замужем".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "разведен/разведена".tr(),
                          child: Text(
                            "разведен/разведена".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(4.0)),
                    TextFormField(
                      controller: _employmentController,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Занятость*'.tr(),
                        labelText: 'Занятость*'.tr(),
                        suffixIcon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(4.0)),
                    SizedBox(height: getHeight(70.0)),
                    MyElevatedButton(
                      text: 'Сохранить'.tr(),
                      textSize: 36,
                      height: 83,
                      width: 473,
                      primaryColor: AppColors.transparentColor,
                      sideColor: AppColors.orangeColor,
                      radius: getHeight(30),
                      sideWidth: getHeight(2),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          isload = true;
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          if (hasInternet) {
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
                                      builder: (context) => TabMainPage(),
                                    ),
                                    (route) => false,
                                  )
                                : null;
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TabNoConnectionPage(),
                              ),
                            );
                          }
                          isload = false;
                        }
                      },
                    ),
                    const Spacer(),
                    // SizedBox(height: getHeight(45.0)),
                    RichTextWidget(
                      textsize: 20,
                    ),
                    SizedBox(height: getHeight(20.0)),
                  ],
                ),
              ),
            ),
    );
  }
}

import 'dart:io' show Platform;
import 'package:asia_uz/tablet/auth/info/tab_bonus.dart';
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

  String? birthday;
  bool isload = false;
  String? pol;
  String? zanyatost;
  String? notifLang;
  String platform = Platform.operatingSystem;

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetStorage().write("platform", platform);
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        text: 'Профиль'.tr(),
        textSize: getHeight(30),
      ),
      body: isload == true
          ? Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                color: AppColors.orange,
                fit: BoxFit.cover,
                height: getHeight(70),
              ),
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
                        height: getHeight(83),
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
                    DropdownButtonFormField(
                      hint: Text(
                        'Занятость*'.tr(),
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
                      onChanged: (String? v) {
                        zanyatost = v;
                        debugPrint("zanyatost: $v");
                      },
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: "Гос.служба".tr(),
                          child: Text(
                            "Гос.служба".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Частный сектор".tr(),
                          child: Text(
                            "Частный сектор".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Социальная сфера".tr(),
                          child: Text(
                            "Социальная сфера".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Пенсионер".tr(),
                          child: Text(
                            "Пенсионер".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Учащийся".tr(),
                          child: Text(
                            "Учащийся".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Домохозяйка".tr(),
                          child: Text(
                            "Домохозяйка".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Временно неработающий".tr(),
                          child: Text(
                            "Временно неработающий".tr(),
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
                                      platform: platform,
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
                                      builder: (context) =>
                                          const TabBonusPage(),
                                    ),
                                    (route) => false,
                                  )
                                : debugPrint("else ga otib ketti");
                            isload = false;
                            debugPrint("loyality cards service ishga tushdi");
                            DevicesService.devicesService();
                            LoyalityCardsService.getLoyalityCardsService();
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
                      textsize: 16,
                      width: 400,
                    ),
                    SizedBox(height: getHeight(20.0)),
                  ],
                ),
              ),
            ),
    );
  }
}

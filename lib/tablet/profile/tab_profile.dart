import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
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
  final TextEditingController genderController = TextEditingController();
  final TextEditingController semeynoePolojeniyaController =
      TextEditingController();
  final TextEditingController zanyatostController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  String? semeynoePolojeniya;
  String? birthday;
  bool isload = false;
  String? gender;
  String? zanyatost;
  String? notifLang;
  String platform = Platform.operatingSystem;

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    genderController.dispose();
    semeynoePolojeniyaController.dispose();
    zanyatostController.dispose();
    birthdayController.dispose();
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
      body: Form(
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
                validator: (v) => v!.isEmpty ? 'Familiya kiritilmadi' : null,
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
              TextFormField(
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColors.black,
                ),
                readOnly: true,
                keyboardType: TextInputType.none,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              gender = "male";
                              genderController.text = "мужчина".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "мужчина".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              gender = "female";
                              genderController.text = "женщина".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "женщина".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      );
                    },
                  );
                },
                controller: genderController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black,
                  ),
                  hintText: 'Пол*'.tr(),
                  // labelText: 'Пол*'.tr(),
                ),
                validator: (v) => v!.isEmpty ? 'Пол не был выбран'.tr() : null,
              ),
              SizedBox(height: getHeight(4.0)),
              SizedBox(height: getHeight(4.0)),
              TextFormField(
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColors.black,
                ),

                // enabled: false,
                // showCursor: true,
                readOnly: true,
                keyboardType: TextInputType.none,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              semeynoePolojeniya = "married";
                              semeynoePolojeniyaController.text =
                                  "женат/замужем".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "женат/замужем".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              semeynoePolojeniya = "not married";
                              semeynoePolojeniyaController.text =
                                  "холост/не замужем".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "холост/не замужем".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              semeynoePolojeniya = "divorced";
                              semeynoePolojeniyaController.text =
                                  "разведен/разведена".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "разведен/разведена".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      );
                    },
                  );
                },
                controller: semeynoePolojeniyaController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black,
                  ),
                  hintText: 'Семейное положение*'.tr(),
                ),
                validator: (v) =>
                    v!.isEmpty ? 'Семейное положение не выбрано'.tr() : null,
              ),
              SizedBox(height: getHeight(4.0)),
              SizedBox(height: getHeight(4.0)),
              SizedBox(height: getHeight(4.0)),
              TextFormField(
                readOnly: true,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColors.black,
                ),
                keyboardType: TextInputType.none,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "State service";
                              zanyatostController.text = "Гос.служба".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Гос.служба".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Private sector";
                              zanyatostController.text = "Частный сектор".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Частный сектор".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Social sphere";
                              zanyatostController.text =
                                  "Социальная сфера".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Социальная сфера".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Pensioner";
                              zanyatostController.text = "Пенсионер".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Пенсионер".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Strudent";
                              zanyatostController.text = "Учащийся".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Учащийся".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          //
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Housewife";
                              zanyatostController.text = "Домохозяйка".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Домохозяйка".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              zanyatost = "Temporarily unemployed";
                              zanyatostController.text =
                                  "Временно неработающий".tr();
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "Временно неработающий".tr(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      );
                    },
                  );
                },
                controller: zanyatostController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black,
                  ),
                  hintText: 'Занятость*'.tr(),
                ),
              ),
              SizedBox(height: getHeight(4.0)),
              SizedBox(height: getHeight(70.0)),
              MyElevatedButton(
                child: isload == true
                    ? Center(
                        child: Image.asset(
                          "assets/images/loading_indicator.gif",
                          fit: BoxFit.cover,
                          height: getHeight(40),
                        ),
                      )
                    : null,
                text: 'Сохранить'.tr(),
                textSize: 36,
                height: 83,
                width: 473,
                primaryColor: AppColors.transparentColor,
                sideColor: AppColors.orangeColor,
                radius: getHeight(30),
                sideWidth: getHeight(2),
                onPressed: isload == true
                    ? () {
                        debugPrint("Isload true and button can't be touched");
                      }
                    : () async {
                        // bu joyda inputlarni validatsiyadan otkazamiza
                        if (_formKey.currentState!.validate()) {
                          bool hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          debugPrint("has internet: $hasInternet");
                          // internetni ketshiramiza
                          if (hasInternet) {
                            isload = true;
                            setState(() {});
                            // Storage ga ism ni yozib qoyamiza
                            GetStorage().write(
                              "firstName",
                              _firstNameController.text,
                            );
                            debugPrint(
                                """
platform: ${GetStorage().read("platform")}
dob: $birthday
firstname: ${_firstNameController.text}
lastname: ${_lastNameController.text}
gender: $gender
zanyatost: $zanyatost
zanyatost: ${zanyatostController.text}

semeynoePolojeniya: $semeynoePolojeniya
semeynoePolojeniya: ${semeynoePolojeniyaController.text}
materialstatus: true
notificationLanguage:$notifLang,
notificationPreference: "sms",
occupation: "occupation",
""");
                            await CustomersServices.cuspomersService(
                              platform: platform,
                              dob: birthday!,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              gender: gender ?? "male",
                              materialStatus: true,
                              notificationLanguage: notifLang ?? "russian",
                              notificationPreference: "sms",
                              occupation: "occupation",
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabMainPage(),
                              ),
                              (route) => false,
                            );
                            isload = false;
                            debugPrint("loyality cards service ishga tushdi");
                            LoyalityCardsService.getLoyalityCardsService();
                            // DevicesService.devicesService("asa");
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TabNoConnectionPage(),
                              ),
                            );
                          }
                        } else {
                          showAlertDialogMethod(context);
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

  showAlertDialogMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Ma'lumotlarni toliq kiriting",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(30),
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(80),
              width: getWidth(280),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Вернуться на главную".tr(),
              textColor: AppColors.whiteColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:asia_uz/screens/view/auth/info/onboarding_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    // bu pageda foydalanuvchi registratsiyadan otadi
    GetStorage().write("platform", platform);
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        text: 'Профиль'.tr(),
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
                  decoration: InputDecoration(
                    hintText: 'Имя*'.tr(),
                    labelText: 'Имя*'.tr(),
                  ),
                  validator: (v) => v!.isEmpty ? 'Имя не введено'.tr() : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Фамилия*'.tr(),
                    labelText: 'Фамилия*'.tr(),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Фамилия не введена'.tr() : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.none,
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
                        birthdayController.text = birthday!;
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.ru,
                    );
                  },
                  controller: birthdayController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                    hintText: "Дата рождения*".tr(),
                    // labelText: "Дата рождения*".tr(),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Дата рождения не введена'.tr() : null,
                ),
                SizedBox(height: getHeight(4.0)),
                SizedBox(height: getHeight(4.0)),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
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
                              child: Text("мужчина".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                gender = "female";
                                genderController.text = "женщина".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("женщина".tr()),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
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
                  validator: (v) =>
                      v!.isEmpty ? 'Пол не был выбран'.tr() : null,
                ),
                SizedBox(height: getHeight(4.0)),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
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
                              child: Text("женат/замужем".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                semeynoePolojeniya = "not married";
                                semeynoePolojeniyaController.text =
                                    "холост/не замужем".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("холост/не замужем".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                semeynoePolojeniya = "divorced";
                                semeynoePolojeniyaController.text =
                                    "разведен/разведена".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("разведен/разведена".tr()),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
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
                              child: Text("Гос.служба".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Private sector";
                                zanyatostController.text =
                                    "Частный сектор".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Частный сектор".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Social sphere";
                                zanyatostController.text =
                                    "Социальная сфера".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Социальная сфера".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Pensioner";
                                zanyatostController.text = "Пенсионер".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Пенсионер".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Strudent";
                                zanyatostController.text = "Учащийся".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Учащийся".tr()),
                            ),
                            //
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Housewife";
                                zanyatostController.text = "Домохозяйка".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Домохозяйка".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                zanyatost = "Temporarily unemployed";
                                zanyatostController.text =
                                    "Временно неработающий".tr();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("Временно неработающий".tr()),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
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
                            height: getHeight(25),
                          ),
                        )
                      : null,
                  text: 'Сохранить'.tr(),
                  textSize: 16,
                  fontWeight: FontWeight.w600,
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
                                  builder: (context) =>
                                      const OnBoardingScreenPage(),
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
                                      const NoConnectionPage(),
                                ),
                              );
                            }
                          } else {
                            showAlertDialogMethod(context);
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
                RichTextWidget(),
                SizedBox(height: getHeight(40.0)),
              ],
            ),
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
              fontSize: getHeight(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
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

  qaytaRegistratsiyaAlertDialogMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Siz ro'yxatdan o'tib bo'lgansiz",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
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

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
    // bu pageda foydalanuvchi registratsiyadan otadi
    GetStorage().write("platform", platform);
    SizeConfig().init(context);
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
                        decoration: InputDecoration(
                          hintText: 'Имя*'.tr(),
                          labelText: 'Имя*'.tr(),
                        ),
                        validator: (v) =>
                            v!.isEmpty ? 'Имя не введено'.tr() : null,
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
                                    "Дата рождения*".tr(),
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
                        hint: Text("Пол*".tr()),
                        icon: Padding(
                          padding: EdgeInsets.only(right: getHeight(13)),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        validator: (v) =>
                            v == null ? "Пол не был выбран".tr() : null,
                        onChanged: (String? v) {
                          pol = v;
                          debugPrint("gender: $v");
                        },
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "мужчина".tr(),
                            child: Text("мужчина".tr()),
                          ),
                          DropdownMenuItem(
                            value: "женщина".tr(),
                            child: Text("женщина".tr()),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(4.0)),
                      SizedBox(height: getHeight(4.0)),
                      DropdownButtonFormField(
                        hint: Text(
                          "Семейное положение*".tr(),
                        ),
                        icon: Padding(
                          padding: EdgeInsets.only(right: getHeight(10)),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          ),
                        ),
                        // value: "",
                        validator: (v) => v == null
                            ? "Семейное положение не выбрано".tr()
                            : null,
                        onChanged: (String? v) {
                          pol = v;
                          debugPrint("gender: $v");
                        },
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "женат/замужем".tr(),
                            child: Text("женат/замужем".tr()),
                          ),
                          DropdownMenuItem(
                            value: "холост/не замужем".tr(),
                            child: Text("холост/не замужем".tr()),
                          ),
                          DropdownMenuItem(
                            value: "разведен/разведена".tr(),
                            child: Text(
                              "разведен/разведена".tr(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(4.0)),
                      DropdownButtonFormField(
                        hint: Text(
                          'Занятость*'.tr(),
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
                            child: Text("Гос. служба".tr()),
                          ),
                          DropdownMenuItem(
                            value: "Частный сектор ".tr(),
                            child: Text("Частный сектор ".tr()),
                          ),
                          DropdownMenuItem(
                            value: "Социальная сфера ".tr(),
                            child: Text(
                              "Социальная сфера ".tr(),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Пенсионер".tr(),
                            child: Text("Пенсионер".tr()),
                          ),
                          DropdownMenuItem(
                            value: "Учасиийся".tr(),
                            child: Text("Учасиийся".tr()),
                          ),
                          DropdownMenuItem(
                            value: "Домохозяйка".tr(),
                            child: Text(
                              "Домохозяйка".tr(),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Временно неработающий".tr(),
                            child: Text(
                              "Временно неработающий".tr(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(4.0)),
                      SizedBox(height: getHeight(70.0)),
                      MyElevatedButton(
                        text: 'Сохранить'.tr(),
                        onPressed: () async {
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
gender: $pol
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
                                  : debugPrint("Else ga otib ketti");
                              isload = false;
                              debugPrint("loyality cards service ishga tushdi");
                              DevicesService.devicesService();
                              LoyalityCardsService.getLoyalityCardsService();
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NoConnectionPage(),
                                ),
                              );
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
                      RichTextWidget(),
                      SizedBox(height: getHeight(40.0)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

import 'package:asia_uz/service/api/post/customers_service.dart';
import 'package:asia_uz/tablet/main/tab_main.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../core/components/view/my_app_bar.dart';

class TabProfilePage extends StatefulWidget {
  TabProfilePage({Key? key}) : super(key: key);

  @override
  State<TabProfilePage> createState() => _TabProfilePageState();
}

class _TabProfilePageState extends State<TabProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _seminalPositionController =
      TextEditingController();

  final TextEditingController _employmentController = TextEditingController();

  String? birthday;
  bool isload = false;

  @override
  Widget build(BuildContext context) {
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
        text: 'Профиль',
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
                      decoration: const InputDecoration(
                        hintText: 'Имя*',
                        labelText: 'Имя*',
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
                                const Text(
                                  "Дата рождения",
                                  style: TextStyle(
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
                      hint: const Text(
                        "Пол*",
                        style: TextStyle(
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
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: "мужчина",
                          child: Text(
                            "мужчина",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "женщина",
                          child: Text(
                            "женщина",
                            style: TextStyle(
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
                      hint: const Text(
                        "Семейное положение*",
                        style: TextStyle(
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
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "холост/не замужем",
                          child: Text(
                            "холост/не замужем",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "разведен/разведена",
                          child: Text(
                            "разведен/разведена",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TextFormField(
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 24,
                    //     color: AppColors.black,
                    //   ),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColors.black,
                      ),
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
                          setState(() {});
                          await GetStorage()
                              .write("firstName", _firstNameController.text);
                          await GetStorage()
                              .write("lastName", _lastNameController.text);
                          await GetStorage().write("dateOfBirth", birthday);
                          await GetStorage().write("gender", pol);
                          await GetStorage().write("notifLang", notifLang);
                          await GetStorage()
                              .write("pol", _seminalPositionController.text);
                          await GetStorage()
                              .write("zanyatost", _employmentController.text);
                          // _context.validateState();
                          // _context.clear();
                          debugPrint("""
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
                          isload = false;
                        }
                      },
                    ),
                    const Spacer(),
                    // SizedBox(height: getHeight(45.0)),
                    SizedBox(
                      height: getHeight(72.0),
                      width: getWidth(512.0),
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
                                fontSize: getWidth(20.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ("условиями "),
                              style: TextStyle(
                                color: AppColors.teal,
                                fontSize: getWidth(20.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ("Обработки персональных "),
                              style: TextStyle(
                                color: AppColors.onPressColor,
                                fontSize: getWidth(20.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ("данных,\n"),
                              style: TextStyle(
                                color: AppColors.teal,
                                fontSize: getWidth(20.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ("Программой лояльности и Публичной аферты"),
                              style: TextStyle(
                                color: AppColors.onPressColor,
                                fontSize: getWidth(20.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(20.0)),
                  ],
                ),
              ),
            ),
    );
  }
}

// import 'package:asia_uz/screens/view/auth/info/bonus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:asia_uz/core/imports/imports.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _firstNameController = TextEditingController();

//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();
//   final TextEditingController semeynoePolojeniyaController =
//       TextEditingController();
//   final TextEditingController zanyatostController = TextEditingController();

//   String? birthday;
//   bool isload = false;
//   String? pol;
//   String? zanyatost;
//   String? notifLang;
//   String platform = Platform.operatingSystem;

//   @override
//   void dispose() {
//     super.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // bu pageda foydalanuvchi registratsiyadan otadi
//     GetStorage().write("platform", platform);
//     SizeConfig().init(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: MyAppBar(
//         text: 'Профиль'.tr(),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: getWidth(23.0),
//               vertical: getHeight(6.0),
//             ),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: _firstNameController,
//                   decoration: InputDecoration(
//                     hintText: 'Имя*'.tr(),
//                     labelText: 'Имя*'.tr(),
//                   ),
//                   validator: (v) => v!.isEmpty ? 'Имя не введено'.tr() : null,
//                 ),
//                 SizedBox(height: getHeight(4.0)),
//                 TextFormField(
//                   controller: _lastNameController,
//                   decoration: InputDecoration(
//                     hintText: 'Фамилия*'.tr(),
//                     labelText: 'Фамилия*'.tr(),
//                   ),
//                   validator: (v) =>
//                       v!.isEmpty ? 'Фамилия не введена'.tr() : null,
//                 ),
//                 SizedBox(height: getHeight(4.0)),
//                 InkWell(
//                   onTap: () {
//                     DatePicker.showDatePicker(
//                       context,
//                       showTitleActions: true,
//                       maxTime: DateTime.now(),
//                       onChanged: (datetime) {
//                         debugPrint("changed: $datetime");
//                       },
//                       onConfirm: (datetime) {
//                         birthday =
//                             "${datetime.day}/${datetime.month}/${datetime.year}";
//                         debugPrint(datetime.toString());

//                         debugPrint(birthday);
//                         setState(() {});
//                       },
//                       currentTime: DateTime.now(),
//                       locale: LocaleType.ru,
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         border: Border(
//                       bottom: BorderSide(
//                         color: AppColors.black,
//                         width: getWidth(0.5),
//                       ),
//                     )),
//                     height: getHeight(50),
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               "Дата рождения*".tr(),
//                               style: TextStyle(
//                                 fontSize: getHeight(14),
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.bottomUnselectedColor,
//                               ),
//                             ),
//                             Text(
//                               birthday ?? "",
//                               style: TextStyle(
//                                 fontSize: getHeight(16),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(right: getWidth(11)),
//                           child: const Icon(
//                             Icons.arrow_forward_ios,
//                             color: AppColors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: getHeight(4.0)),
//                 // DropdownButtonFormField(
//                 //   hint: Text("Пол*".tr()),
//                 //   icon: Padding(
//                 //     padding: EdgeInsets.only(right: getHeight(13)),
//                 //     child: const Icon(
//                 //       Icons.arrow_forward_ios,
//                 //       color: AppColors.black,
//                 //     ),
//                 //   ),
//                 //   validator: (v) => v == null ? "Пол не был выбран".tr() : null,
//                 //   onChanged: (String? v) {
//                 //     pol = v;
//                 //     debugPrint("gender: $v");
//                 //   },
//                 //   items: <DropdownMenuItem<String>>[
//                 //     DropdownMenuItem(
//                 //       value: "man",
//                 //       child: Text("мужчина".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "woman",
//                 //       child: Text("женщина".tr()),
//                 //     ),
//                 //   ],
//                 // ),
//                 // SizedBox(height: getHeight(4.0)),
//                 // SizedBox(height: getHeight(4.0)),
//                 // DropdownButtonFormField(
//                 //   hint: Text(
//                 //     "Семейное положение*".tr(),
//                 //   ),
//                 //   icon: Padding(
//                 //     padding: EdgeInsets.only(right: getHeight(10)),
//                 //     child: const Icon(
//                 //       Icons.arrow_forward_ios,
//                 //       color: AppColors.black,
//                 //     ),
//                 //   ),
//                 //   // value: "",
//                 //   validator: (v) =>
//                 //       v == null ? "Семейное положение не выбрано".tr() : null,
//                 //   onChanged: (String? v) {
//                 //     pol = v;
//                 //     debugPrint("gender: $v");
//                 //   },
//                 //   items: <DropdownMenuItem<String>>[
//                 //     DropdownMenuItem(
//                 //       value: "married",
//                 //       child: Text("женат/замужем".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "not married",
//                 //       child: Text("холост/не замужем".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "divorced",
//                 //       child: Text(
//                 //         "разведен/разведена".tr(),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // SizedBox(height: getHeight(4.0)),
//                 // DropdownButtonFormField(
//                 //   hint: Text(
//                 //     'Занятость*'.tr(),
//                 //   ),
//                 //   icon: Padding(
//                 //     padding: EdgeInsets.only(right: getHeight(10)),
//                 //     child: const Icon(
//                 //       Icons.arrow_forward_ios,
//                 //       color: AppColors.black,
//                 //     ),
//                 //   ),
//                 //   onChanged: (String? v) {
//                 //     zanyatost = v;
//                 //     debugPrint("zanyatost: $v");
//                 //   },
//                 //   items: <DropdownMenuItem<String>>[
//                 //     DropdownMenuItem(
//                 //       value: "State service",
//                 //       child: Text("Гос.служба".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Private sector",
//                 //       child: Text("Частный сектор".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Social sphere",
//                 //       child: Text(
//                 //         "Социальная сфера".tr(),
//                 //       ),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Pensioner",
//                 //       child: Text("Пенсионер".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Student",
//                 //       child: Text("Учащийся".tr()),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Housewife",
//                 //       child: Text(
//                 //         "Домохозяйка".tr(),
//                 //       ),
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       value: "Temporarily unemployed",
//                 //       child: Text(
//                 //         "Временно неработающий".tr(),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 SizedBox(height: getHeight(4.0)),
//                 InkWell(
//                   onTap: () {
//                     showCupertinoModalPopup(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoActionSheet(
//                           actions: [
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 genderController.text = "man";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("мужчина".tr()),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 genderController.text = "woman";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("женщина".tr()),
//                             ),
//                           ],
//                           cancelButton: CupertinoActionSheetAction(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text("Cancel"),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: TextFormField(
//                     enabled: false,
//                     controller: genderController,
//                     decoration: InputDecoration(
//                       suffixIcon: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: AppColors.black,
//                       ),
//                       hintText: 'Пол*'.tr(),
//                       labelText: 'Пол*'.tr(),
//                     ),
//                     validator: (v) =>
//                         v!.isEmpty ? 'Фамилия не введена'.tr() : null,
//                   ),
//                 ),
//                 SizedBox(height: getHeight(4.0)),
//                 SizedBox(height: getHeight(4.0)),
//                 InkWell(
//                   onTap: () {
//                     showCupertinoModalPopup(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoActionSheet(
//                           actions: [
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 semeynoePolojeniyaController.text = "married";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("женат/замужем".tr()),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 semeynoePolojeniyaController.text =
//                                     "not married";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("холост/не замужем".tr()),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 semeynoePolojeniyaController.text = "divorced";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("разведен/разведена".tr()),
//                             ),
//                           ],
//                           cancelButton: CupertinoActionSheetAction(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text("Cancel"),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: TextFormField(
//                     enabled: false,
//                     controller: semeynoePolojeniyaController,
//                     decoration: InputDecoration(
//                       suffixIcon: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: AppColors.black,
//                       ),
//                       hintText: 'Семейное положение*'.tr(),
//                       labelText: 'Семейное положение*'.tr(),
//                     ),
//                     validator: (v) =>
//                         v!.isEmpty ? 'Фамилия не введена'.tr() : null,
//                   ),
//                 ),
//                 SizedBox(height: getHeight(4.0)),
//                 SizedBox(height: getHeight(4.0)),
//                 SizedBox(height: getHeight(4.0)),
//                 InkWell(
//                   onTap: () {
//                     showCupertinoModalPopup(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoActionSheet(
//                           actions: [
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 // DropdownMenuItem(
//                                 //       value: "State service",
//                                 //       child: Text("Гос.служба".tr()),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Private sector",
//                                 //       child: Text("Частный сектор".tr()),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Social sphere",
//                                 //       child: Text(
//                                 //         "Социальная сфера".tr(),
//                                 //       ),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Pensioner",
//                                 //       child: Text("Пенсионер".tr()),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Student",
//                                 //       child: Text("Учащийся".tr()),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Housewife",
//                                 //       child: Text(
//                                 //         "Домохозяйка".tr(),
//                                 //       ),
//                                 //     ),
//                                 //     DropdownMenuItem(
//                                 //       value: "Temporarily unemployed",
//                                 //       child: Text(
//                                 //         "Временно неработающий".tr(),
//                                 //       ),
//                                 semeynoePolojeniyaController.text = "married";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("женат/замужем".tr()),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 semeynoePolojeniyaController.text =
//                                     "not married";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("холост/не замужем".tr()),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 semeynoePolojeniyaController.text = "divorced";
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               },
//                               child: Text("разведен/разведена".tr()),
//                             ),
//                           ],
//                           cancelButton: CupertinoActionSheetAction(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text("Cancel"),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: TextFormField(
//                     enabled: false,
//                     controller: zanyatostController,
//                     decoration: InputDecoration(
//                       suffixIcon: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: AppColors.black,
//                       ),
//                       hintText: 'Занятость*'.tr(),
//                       labelText: 'Занятость*'.tr(),
//                     ),
//                     validator: (v) =>
//                         v!.isEmpty ? 'Фамилия не введена'.tr() : null,
//                   ),
//                 ),

//                 SizedBox(height: getHeight(4.0)),
//                 SizedBox(height: getHeight(70.0)),
//                 MyElevatedButton(
//                   child: isload == true
//                       ? Center(
//                           child: Image.asset(
//                             "assets/images/loading_indicator.gif",
//                             fit: BoxFit.cover,
//                             height: getHeight(25),
//                           ),
//                         )
//                       : null,
//                   text: 'Сохранить'.tr(),
//                   onPressed: isload == true
//                       ? () {
//                           debugPrint("Isload true and button can't be touched");
//                         }
//                       : () async {
//                           // bu joyda inputlarni validatsiyadan otkazamiza
//                           if (_formKey.currentState!.validate()) {
//                             debugPrint(
//                               "zanyatost: ${zanyatostController.text} gender: ${genderController.text}",
//                             );
//                             zanyatostController.text = "Yengicha soz";
//                             genderController.text = "yana bitta soz";

// //                             bool hasInternet =
// //                                 await InternetConnectionChecker().hasConnection;
// //                             debugPrint("has internet: $hasInternet");
// //                             // internetni ketshiramiza
// //                             if (hasInternet) {
// //                               isload = true;
// //                               setState(() {});
// //                               // Storage ga ism ni yozib qoyamiza
// //                               GetStorage().write(
// //                                 "firstName",
// //                                 _firstNameController.text,
// //                               );
// //                               debugPrint(
// //                                   """
// // platform: ${GetStorage().read("platform")}
// // dob: $birthday
// // firstname: ${_firstNameController.text}
// // lastname: ${_lastNameController.text}
// // gender: $pol
// // materialstatus: true
// // notificationLanguage:$notifLang,
// // notificationPreference: "sms",
// // occupation: "occupation",
// // """);
// //                               await CustomersServices.cuspomersService(
// //                                 platform: platform,
// //                                 dob: birthday!,
// //                                 firstName: _firstNameController.text,
// //                                 lastName: _lastNameController.text,
// //                                 gender: pol ?? "женщина",
// //                                 materialStatus: true,
// //                                 notificationLanguage: notifLang ?? "russian",
// //                                 notificationPreference: "sms",
// //                                 occupation: "occupation",
// //                               );
// //                               Navigator.pushAndRemoveUntil(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => const BonusPage(),
// //                                 ),
// //                                 (route) => false,
// //                               );
// //                               isload = false;
// //                               debugPrint("loyality cards service ishga tushdi");
// //                               DevicesService.devicesService();
// //                               LoyalityCardsService.getLoyalityCardsService();
// //                             } else {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) =>
// //                                       const NoConnectionPage(),
// //                                 ),
// //                               );
// //                             }
//                           } else {
//                             showAlertDialogMethod(context);
//                             zanyatostController.clear();
//                             genderController.clear();
//                           }
//                         },
//                   height: getHeight(50),
//                   // width: 161.0,
//                   primaryColor: AppColors.transparentColor,
//                   sideColor: AppColors.orangeColor,
//                   radius: getHeight(15),
//                   sideWidth: getHeight(2),
//                 ),
//                 SizedBox(height: getHeight(120.0)),
//                 RichTextWidget(),
//                 SizedBox(height: getHeight(40.0)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   showAlertDialogMethod(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           actionsPadding: const EdgeInsets.all(8),
//           alignment: Alignment.center,
//           elevation: 2,
//           content: Text(
//             "Ma'lumotlarni toliq kiriting",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: AppColors.black,
//               fontSize: getHeight(24),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             MyElevatedButton(
//               height: getHeight(52),
//               width: getWidth(223),
//               sideColor: AppColors.whiteColor,
//               primaryColor: AppColors.orangeColor,
//               text: "Вернуться на главную".tr(),
//               textColor: AppColors.whiteColor,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   qaytaRegistratsiyaAlertDialogMethod(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           actionsPadding: const EdgeInsets.all(8),
//           alignment: Alignment.center,
//           elevation: 2,
//           content: Text(
//             "Siz ro'yxatdan o'tib bo'lgansiz",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: AppColors.black,
//               fontSize: getHeight(24),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             MyElevatedButton(
//               height: getHeight(52),
//               width: getWidth(223),
//               sideColor: AppColors.whiteColor,
//               primaryColor: AppColors.orangeColor,
//               text: "Вернуться на главную".tr(),
//               textColor: AppColors.whiteColor,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:asia_uz/service/api/post/loyality_phythical.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _messangeController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? type;
  // int status = 0;

  @override
  void initState() {
    super.initState();
    _messangeController;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _messangeController.clear();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bu page da foydalanuvchi taklif va etirozlarini jonatishi mumkin
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: getHeight(130),
              ),
              Container(
                margin: EdgeInsets.all(getWidth(10.0)),
                height: getHeight(50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getWidth(15.0),
                  ),
                  color: Colors.orange.shade200,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: AppColors.whiteColor,
                  indicatorWeight: getWidth(1.0),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.orangeColor,
                  ),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'Новый отзыв'.tr(),
                    ),
                    Tab(
                      text: 'История'.tr(),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.yellow,
                height: getHeight(550.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: getHeight(30.0)),
                        SizedBox(
                          width: getWidth(340.0),
                          child: Text(
                            "Любой ваш отзыв важен для нас.\nПоля, помеченные (*),\nобязательны для заполнения"
                                .tr(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getWidth(16.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getHeight(40),
                              ),
                              Text(
                                "Сообщение*",
                                style: TextStyle(
                                  color: AppColors.drawerTextColor,
                                  fontSize: getHeight(16),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFormField(
                                controller: _messangeController,
                                decoration: const InputDecoration(),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (v) => v!.isEmpty
                                    ? "отзыв не может быть пустым".tr()
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          keyboardType: TextInputType.none,
                          controller: _typeController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.teal,
                            ),
                            hintText: 'Выберите тип обращения*'.tr(),
                          ),
                          onTap: () {
                            bottomsheetMethod();
                            // debugPrint("type: $type");
                          },
                        ).all(20),
                        // dropDownButtonMethod().all(20),
                        MyElevatedButton(
                          text: 'Продолжить'.tr(), textSize: getHeight(18),
                          fontWeight: FontWeight.w400,
                          onPressed: () async {
                            debugPrint("type iwlawi: $type");
                            // malumotlarni kiritganidan kegin request jonatishi
                            // mumkin boladi
                            if (formkey.currentState!.validate()) {
                              debugPrint(_messangeController.text.toString());
                              bool hasInternet =
                                  await InternetConnectionChecker()
                                      .hasConnection;
                              debugPrint("has internet: $hasInternet");
                              if (hasInternet) {
                                String res =
                                    await FeedbacksService.feedbacksService(
                                  type: type ?? "Other",
                                  message: _messangeController.text,
                                );
                                if (res != null) {
                                  ShowAlertDialogWidget.ShowAlertDialog(
                                    context: context,
                                    buttonText: "",
                                    contentText: "",
                                  );
                                  _messangeController.clear();
                                  debugPrint("res: $res");
                                }
                                hideKeyboard(context);
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
                          sideWidth: getWidth(2),
                        ),
                        SizedBox(height: getHeight(20.0)),
                        Text(
                          "Также вы можете обратиться в службу технической поддержки"
                              .tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: getWidth(16.0),
                          ),
                        ),
                        SizedBox(height: getHeight(20.0)),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                getWidth(30.0),
                              ),
                            ),
                            fixedSize: Size(
                              getWidth(285.0),
                              getHeight(50.0),
                            ),
                            side: BorderSide(
                              color: AppColors.black,
                              width: getWidth(1.0),
                            ),
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actionsOverflowButtonSpacing: 5,
                                  actionsPadding: const EdgeInsets.all(8),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20,
                                  ),
                                  alignment: Alignment.center,
                                  elevation: 2,
                                  content: Text(
                                    "Карта успешно добавлена",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: getHeight(20),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    MyElevatedButton(
                                      height: getHeight(52),
                                      width: getWidth(223),
                                      sideColor: AppColors.whiteColor,
                                      primaryColor: AppColors.orangeColor,
                                      text: "Вернуться на главную",
                                      textColor: AppColors.whiteColor,
                                      onPressed: () {
                                        // GetStorage().write("barcode", barcode!.code);
                                        Navigator.pop(context);
                                        // Navigator.pop(context);
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                            // return Container(
                            //   margin: EdgeInsets.all(150),
                            //   height: 300,
                            //   width: 200,
                            //   color: Colors.yellow,
                            // );

                            // AwesomeDialog(
                            //   context: context,
                            //   animType: AnimType.SCALE,
                            //   dialogType: DialogType.SUCCES,
                            //   // dialogBackgroundColor: AppColors.orange,
                            //   body: Center(
                            //     child: Text(
                            //       'Карта успешно добавлена',
                            //       style: TextStyle(fontStyle: FontStyle.italic),
                            //     ),
                            //   ),
                            //   title: 'This is Ignored',
                            //   desc: 'This is also Ignored',
                            //   // btnOkText: "Вернуться на главную",
                            //   // btnOkColor: AppColors.orange,
                            //   btnOk: MyElevatedButton(
                            //     primaryColor: AppColors.orange,
                            //     textColor: AppColors.whiteColor,
                            //     text: "Вернуться на главную",
                            //     onPressed: () {
                            //       Navigator.pop(context);
                            //     },
                            //   ),
                            //   btnOkOnPress: () {},
                            // )..show();

                            // int status = await LoyalityPhythicalService
                            //     .loyalityPhythicalService(
                            //   "7777000006693",
                            // );
                            // debugPrint("statusCode: $status");
                            // if (status == 401 || status == 400) {
                            //   showModalBottomSheet(
                            //     context: context,
                            //     backgroundColor: Colors.green,
                            //     builder: (context) => Container(),
                            //   );
                            // } else if (status == 200 || status == 201) {
                            //   showModalBottomSheet(
                            //     context: context,
                            //     backgroundColor: Colors.yellow,
                            //     builder: (context) => Container(),
                            //   );
                            // }
                            // debugPrint(
                            //     "endi ikinchisini ichiga kirdi: $status");
                            // debugPrint("status oxiri:$status");
                            // showModalBottomSheet(
                            //   context: context,
                            //   backgroundColor: Colors.cyan,
                            //   builder: (context) => Container(),
                            // );
                            // debugPrint("knopka bosildi");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgIcons.phone),
                              SizedBox(width: getWidth(25.0)),
                              Text(
                                "+998 99 860-63-63",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: getWidth(16.0),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // tabview history qismi shu widget ichida joylashtirilgan
                    const HistoryPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  List<String> typesOfList = [
    'Вопрос',
    'Жалоба',
    'Предложение',
    'Благодарность',
    'Другое',
  ];
  List<String> valuesOfList = [
    'Question',
    'Complaint',
    'Suggestion',
    'Gratitude',
    'Other',
  ];

  bottomsheetMethod() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: getHeight(518),
          width: getWidth(375),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getHeight(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getHeight(5),
                  width: getWidth(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getHeight(5)),
                    color: AppColors.textTite,
                  ),
                ).only(bottom: getHeight(15)),
                MyTextWidget(
                  text: "Выберите тип обращения*",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  textColor: AppColors.black,
                ),
                // SizedBox(height: getHeight(35)),
                Container(
                  // color: Colors.yellow,
                  height: 350,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: typesOfList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _typeController.text = typesOfList[index];
                          type = valuesOfList[index];
                          Navigator.pop(context);
                          debugPrint(
                              "type: $type controlle: ${_typeController.text}");
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              typesOfList[index],
                              style: TextStyle(
                                fontSize: getHeight(18),
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ).only(top: getHeight(30), bottom: getHeight(6)),
                            const Divider(
                              height: 2,
                              thickness: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                MyElevatedButton(
                  text: "Сохранить",
                  sideColor: AppColors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  DropdownButtonFormField<String> dropDownButtonMethod() {
    return DropdownButtonFormField(
      hint: Text(
        "Выберите тип обращения*".tr(),
        style: TextStyle(
          color: AppColors.drawerTextColor,
          fontSize: getHeight(16),
          fontWeight: FontWeight.w400,
        ),
      ),
      icon: Padding(
        padding: EdgeInsets.only(right: getHeight(10)),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.teal,
        ),
      ),
      // value: "",
      validator: (v) => v == null ? "Тип обращения не выбрано".tr() : null,
      onChanged: (String? v) {
        type = v;
        debugPrint("type: $v");
      },
      items: List.generate(
        typesOfList.length,
        (index) => DropdownMenuItem(
          value: valuesOfList[index],
          child: Text(
            typesOfList[index].tr(),
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
            "Сообщение успешно отправлено".tr(),
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

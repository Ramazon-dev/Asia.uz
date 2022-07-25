import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabReviewsPage extends StatefulWidget {
  const TabReviewsPage({Key? key}) : super(key: key);

  @override
  State<TabReviewsPage> createState() => _TabReviewsPageState();
}

class _TabReviewsPageState extends State<TabReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _messangeController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? type;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _messangeController.clear();
    _tabController!.dispose();
    _typeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: getHeight(144),
                  bottom: getHeight(65),
                  left: getWidth(165),
                  right: getWidth(165),
                ),
                height: getHeight(55.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getWidth(20.0),
                  ),
                  color: Colors.orange.shade200,
                ),
                child: TabBar(
                  labelStyle: TextStyle(
                    fontSize: getHeight(20),
                    fontWeight: FontWeight.w600,
                  ),
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
              SizedBox(
                // color: Colors.cyan.shade200,
                height: getHeight(800.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: getWidth(664.0),
                          child: Text(
                            "Любой ваш отзыв важен для нас.\nПоля, помеченные (*),\nобязательны для заполнения"
                                .tr(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getWidth(32.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getWidth(50),
                            vertical: getHeight(50),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getHeight(60),
                              ),
                              Text(
                                "Сообщение*",
                                style: TextStyle(
                                  color: AppColors.drawerTextColor,
                                  fontSize: getHeight(24),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: getHeight(24),
                                  color: AppColors.teal,
                                ),
                                controller: _messangeController,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontSize: getHeight(24),
                                    color: AppColors.teal,
                                  ),
                                ),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: getHeight(24),
                            color: AppColors.teal,
                          ),
                          keyboardType: TextInputType.none,
                          controller: _typeController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: AppColors.teal,
                            ),
                            hintText: 'Выберите тип обращения*'.tr(),
                          ),
                          onTap: () {
                            bottomsheetMethod();
                            // debugPrint("type: $type");
                          },
                        ).symmetric(horizontal: getWidth(50)),
                        SizedBox(height: getHeight(70)),
                        MyElevatedButton(
                          text: 'Продолжить'.tr(),
                          textSize: getHeight(32),
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
                                  showAlertDialogMethod(context);
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
                          height: getHeight(60),
                          width: getWidth(473),
                          primaryColor: AppColors.transparentColor,
                          sideColor: AppColors.orangeColor,
                          radius: getHeight(30),
                          sideWidth: getWidth(2),
                        ),
                        SizedBox(height: getHeight(60.0)),
                        SizedBox(
                          width: getWidth(460),
                          child: Text(
                            "Также вы можете обратиться в службу технической поддержки"
                                .tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: getHeight(24),
                            ),
                          ),
                        ),
                        SizedBox(height: getHeight(55.0)),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                getWidth(70.0),
                              ),
                            ),
                            fixedSize: Size(
                              getWidth(471.0),
                              getHeight(68.0),
                            ),
                            side: BorderSide(
                              color: AppColors.black,
                              width: getWidth(2.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                SvgIcons.phone,
                                height: getHeight(37),
                              ),
                              SizedBox(width: getWidth(25.0)),
                              Text(
                                "+998 99 860-63-63",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: getHeight(24.0),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const TabHistoryPage(),
                  ],
                ),
              ),
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
          actionsPadding: const EdgeInsets.all(25),
          contentPadding: const EdgeInsets.all(20),
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
          height: getHeight(834),
          width: getWidth(670),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(getHeight(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 45),
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
                  fontSize: 32,
                  textColor: AppColors.black,
                ),
                // SizedBox(height: getHeight(35)),
                SizedBox(
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
                                fontSize: getHeight(24),
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
                  textSize: 32,
                  sideColor: AppColors.orangeColor,
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
}

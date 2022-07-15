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
              Container(
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
                          child: TextFormField(
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.teal,
                            ),
                            controller: _messangeController,
                            decoration: InputDecoration(
                              labelText: "Сообщение*".tr(),
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
                        ),
                        dropDownButtonMethod().symmetric(
                          horizontal: getWidth(50),
                          // vertical: getHeight(50),
                        ),
                        SizedBox(height: getHeight(70)),
                        MyElevatedButton(
                          text: 'Продолжить'.tr(),
                          textSize: getHeight(32),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              debugPrint(_messangeController.text.toString());
                              bool hasInternet =
                                  await InternetConnectionChecker()
                                      .hasConnection;
                              debugPrint("has internet: $hasInternet");
                              if (hasInternet) {
                                String res =
                                    await FeedbacksService.feedbacksService(
                                  type: type ?? "Другое",
                                  message: _messangeController.text,
                                );
                                if (res != null) {
                                  _messangeController.clear();
                                  debugPrint("res: $res");
                                  showAlertDialogMethod(context);
                                }
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
                                GetStorage().read('telNumber'),
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

  List<String> typesOfList = [
    'Вопрос',
    'Жалоба',
    'Предложение',
    'Благодарность',
    'Другое',
  ];

  DropdownButtonFormField<String> dropDownButtonMethod() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: "Выберите тип обращения*".tr(),
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          fontSize: getHeight(24),
          color: AppColors.teal,
        ),
        contentPadding:
            EdgeInsets.only(bottom: getHeight(20), top: getHeight(10)),
      ),
      // hint: Text(
      //   "Выберите тип обращения*".tr(),
      //   style: TextStyle(fontSize: getHeight(20)),
      // ),
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
          value: typesOfList[index].tr(),
          child: Text(
            typesOfList[index].tr(),
            style: TextStyle(
              fontSize: getHeight(24),
              color: AppColors.black,
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
          actionsPadding: const EdgeInsets.all(45),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Сообщение успешно отправлено".tr(),
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
              height: 84,
              width: 456,
              textSize: 32,
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Вернуться на главную".tr(),
              textColor: AppColors.whiteColor,
              onPressed: () {
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:asia_uz/core/widgets/show_alertdialog_widget.dart';
import 'package:asia_uz/service/api/get/feedbacks_my_service.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _messangeController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? type;

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
                              fontSize: getWidth(18.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(20)),
                          child: TextFormField(
                            controller: _messangeController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: AppColors.teal),
                              hintText: "Сообщение*".tr(),
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
                        dropDownButtonMethod().all(20),
                        MyElevatedButton(
                          text: 'Продолжить'.tr(), textSize: getHeight(18),
                          onPressed: () async {
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
                                  type: type ?? "Другое",
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
                            debugPrint("knopka bosildi");
                            // final Uri url = Uri.parse("tel:+1-555-010-999");
                            // if (!await launchUrl(url)) throw "Could not launch $url";
                            // SampleShopRepository().getDateFromApi();
                            // FeedBacksMyService.getFeedbacksMyService();
                            // LoyalityCardsService.getLoyalityCardsService();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgIcons.phone),
                              SizedBox(width: getWidth(25.0)),
                              Text(
                                GetStorage().read('telNumber'),
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

  DropdownButtonFormField<String> dropDownButtonMethod() {
    return DropdownButtonFormField(
      hint: Text(
        "Выберите тип обращения*".tr(),
        style: const TextStyle(color: AppColors.teal),
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

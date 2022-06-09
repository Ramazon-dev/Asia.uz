import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/reviews/widgets/bottom_shett.dart';
import 'package:asia_uz/screens/reviews/widgets/history_page.dart';
import 'package:asia_uz/screens/reviews/widgets/new_review_page.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final TextEditingController _messangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              // color: Colors.red,
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
                tabs: const [
                  Tab(
                    text: 'Новый отзыв',
                  ),
                  Tab(
                    text: 'История',
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.cyan.shade200,
              height: getHeight(450.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      SizedBox(height: getHeight(30.0)),
                      SizedBox(
                        width: getWidth(340.0),
                        child: Text(
                          "Любой ваш отзыв важен для нас.\nПоля, помеченные (*),\nобязательны для заполнения",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: getWidth(18.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
                        child: TextFormField(
                          decoration: const InputDecoration(),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
                                ? 'Do not use the @ char.'
                                : null;
                          },
                        ),
                      ),
                      MyBottomSheet(),
                      MyElevatedButton(
                        text: 'Продолжить', textSize: getHeight(18),
                        onPressed: () {},
                        height: getHeight(50),
                        // width: 161.0,
                        primaryColor: AppColors.transparentColor,
                        sideColor: AppColors.orangeColor,
                        radius: getHeight(15),
                        sideWidth: getWidth(2),
                      ),
                      SizedBox(height: getHeight(20.0)),
                      Text(
                        "Также вы можете обратиться в службу технической поддержки",
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
                        onPressed: () {},
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
                  HistoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

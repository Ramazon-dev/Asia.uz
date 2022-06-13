import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/reviews/widgets/bottom_shett.dart';
import 'package:asia_uz/screens/reviews/widgets/history_page.dart';
import 'package:asia_uz/tablet/main/reviews/widgets/tab_bottomsheet.dart';
import 'package:asia_uz/tablet/main/reviews/widgets/tab_history.dart';
import 'package:flutter/material.dart';

class TabReviewsPage extends StatefulWidget {
  const TabReviewsPage({Key? key}) : super(key: key);

  @override
  State<TabReviewsPage> createState() => _TabReviewsPageState();
}

class _TabReviewsPageState extends State<TabReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
              height: getHeight(800.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: getWidth(664.0),
                        child: Text(
                          "Любой ваш отзыв важен для нас.\nПоля, помеченные (*),\nобязательны для заполнения",
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
                          decoration: const InputDecoration(
                              labelText: "Сообщение*",
                              labelStyle: TextStyle(fontSize: 24)),
                        ),
                      ),
                      TabMyBottomSheet(),
                      SizedBox(height: getHeight(70)),
                      MyElevatedButton(
                        text: 'Продолжить',
                        textSize: getHeight(32),
                        onPressed: () {},
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
                          "Также вы можете обратиться в службу технической поддержки",
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
                  TabHistoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

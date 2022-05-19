import 'package:asia_uz/core/imports/imports.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * getHeight(0.65),
              child: TabBarView(
                controller: _tabController,
                children: [
                  NewReviewPage(),
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

import 'package:asia_uz/core/imports/imports.dart';
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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(getWidth(10.0)),
            height: getHeight(50.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getWidth(15.0),
                ),
                color: Colors.orange.shade200),
            // color: Colors.cyanAccent,
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
            height: getHeight(300.0),
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  height: getHeight(200.0),
                  color: Colors.blue,
                  margin: EdgeInsets.only(
                    top: getHeight(30.0),
                  ),
                  child: Text(
                    '',
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

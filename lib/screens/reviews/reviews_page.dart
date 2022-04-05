import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/reviews/widgets/bottom_shett.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final TextEditingController _messangeController = TextEditingController();

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
              color: Colors.orange.shade200,
            ),
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
            height: MediaQuery.of(context).size.height * 0.65,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(21.0),
                          vertical: getHeight(10.0)),
                      child: TextFormField(
                        controller: _messangeController,
                        decoration: InputDecoration(
                          hintText: 'Сообщение*',
                          hintStyle: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(16.0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),
                    MyBottomSheet(),
                    MyElevatedButton(
                      text: 'Продолжить',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      height: 50.0,
                      // width: 161.0,
                      primaryColor: AppColors.transparentColor,
                      sideColor: AppColors.orange,
                      radius: 15.0,
                      sideWidth: 2.0,
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
                          SizedBox(width: getWidth(5.0)),
                          Text(
                            '+998 ' + GetStorage().read('telNumber'),
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
                Container(
                  alignment: Alignment.center,
                  height: getHeight(200.0),
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: getHeight(30.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: getHeight(170.0)),
                      Text(
                        'История отзывов пуста.',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: getWidth(20.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Вы можете оставить свой отзыв, перейдя в раздел “ Новый отзыв”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: getWidth(14.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

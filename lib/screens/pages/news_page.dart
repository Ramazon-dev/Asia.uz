import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:asia_uz/screens/pages/news_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: MyAppBar(
        text: 'Новости и акции',
        widget: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
        ),
        onTab: () {
          Navigator.pop(context);
          // Navigator.of(context).pop();
          // if(scaffoldKey!.currentState!.isDrawerOpen == true){
          //   false;
          // }else{
          //   true;
          // }
        },
        onPress: () {},
        icon: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(10.0),
                vertical: getHeight(10.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsDetailPage(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getWidth(15.0)),
                  child: Container(
                    color: AppColors.whiteColor,
                    height: getHeight(355.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: getWidth(320.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '22 февраля самые низкие цены\nна манго и авакадо!',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: getWidth(16.0),
                              ),
                            ),
                          ),
                        ).only(top: getHeight(10.0)),
                        Container(
                          height: getHeight(257.0),
                          width: getWidth(331.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getWidth(15.0),
                            ),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/news.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).symmetric(
                            horizontal: getWidth(10.0),
                            vertical: getHeight(20.0)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

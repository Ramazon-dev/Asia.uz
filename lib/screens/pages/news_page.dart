import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:asia_uz/core/constants/loader.dart';
import 'package:asia_uz/core/widgets/notification/notification_page.dart';
import 'package:asia_uz/cubit/news_cubit/news_cubit.dart';
import 'package:asia_uz/cubit/news_cubit/news_state.dart';
import 'package:asia_uz/screens/pages/news_detail_page.dart';
import 'package:asia_uz/service/api/get/news_api_services.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => NewsCubut(
        SimpleNewsServices(),
      ),
      child: BlocConsumer<NewsCubut, NewsState>(
        listener: (context, state){},
        builder: (context, state){
          if(state is NewsInitial){
            return Loader.loader();
          } else if (state is NewsLoading){
            return Loader.loader();
          } else if (state is NewsCompleted){
            debugPrint("News title :${state.response[0].title}");
            return _buildScaffold(context, state);
          } else{
            final error = state as NewsError;
            return const Notifications().flash(context, error.errorMessange, Colors.red);
          }
        },
      ),
    );
  }

  Scaffold _buildScaffold(BuildContext context, NewsCompleted state) {
    return Scaffold(
            backgroundColor: AppColors.unselectedColor,
            appBar: MyAppBar(
              text: 'Новости и акции',
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/icons/arrow_back.png",
                  color: AppColors.whiteColor,
                ),
              ),
              action: const Icon(
                Icons.height,
                color: AppColors.orangeColor,
              ),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state.response.length,
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
                            builder: (context) =>  NewsDetailPage(
                              id: state.response[index].id.toString(),
                            ),
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
                                    // '22 февраля самые низкие цены\nна манго и авакадо!',
                                    state.response[index].title.toString(),
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
                                  image:  DecorationImage(
                                    image: NetworkImage(state.response[index].image.toString()),
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

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/news_model.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _buildScaffold(context);
  }

  _buildScaffold(BuildContext context) {
    return SizedBox(
      height: getHeight(150),
      width: double.infinity,
      child: FutureBuilder<List<NewsModels>>(
        future: SimpleNewsServices().getNews(),
        builder: (context, AsyncSnapshot<List<NewsModels>> snap) {
          if (snap.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(10.0),
                      vertical: getHeight(10.0),
                    ),
                    child: Container(
                      height: getHeight(120.0),
                      width: getWidth(228.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getWidth(15.0),
                        ),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading_indicator.gif",
                        placeholderCacheHeight: 20,
                        placeholderCacheWidth: 20,
                        placeholderScale: 20,
                        image: snap.data![index].image.toString(),
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.contain,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(
                          image: snap.data![index].image ??
                              "https://i.insider.com/61a91b0f5d47cc0018e90ed7?width=1136&format=jpeg",
                          title: snap.data![index].title ?? "",
                          id: snap.data![index].id.toString(),
                          discription: snap.data![index].description ?? "",
                          created: snap.data![index].createdAt.toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snap.hasError) {
            return Center(
              child: Image.asset(
                "assets/images/loading_indicator.gif",
                color: AppColors.orange,
                fit: BoxFit.cover,
                height: getHeight(70),
              ),
            );
          }
          return Center(
            child: Image.asset(
              "assets/images/loading_indicator.gif",
              color: AppColors.orange,
              fit: BoxFit.cover,
              height: getHeight(70),
            ),
          );
        },
      ),
    );
  }

//   _buildScaffold(BuildContext context) {
//     return SizedBox(
//       height: getHeight(150),
//       width: double.infinity,
//       child: BlocProvider(
//         create: (context) => NewsCubut(
//           SimpleNewsServices(),
//         ),
//         child: BlocConsumer<NewsCubut, NewsState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is NewsInitial) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is NewsLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is NewsCompleted) {
//               debugPrint("News title :${state.response[0].title}");
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.response.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: getWidth(10.0),
//                       vertical: getHeight(10.0),
//                     ),
//                     child: Container(
//                       height: getHeight(120.0),
//                       width: getWidth(228.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           getWidth(15.0),
//                         ),
//                       ),
//                       child: FadeInImage.assetNetwork(
//                         placeholder: "assets/images/loading_indicator.gif",
//                         image: state.response[index].image.toString(),
//                         fit: BoxFit.cover,
//                         placeholderFit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               final error = state as NewsError;
//               return const Notifications()
//                   .flash(context, error.errorMessange, Colors.red);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

}

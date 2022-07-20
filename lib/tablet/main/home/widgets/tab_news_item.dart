import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/news_model.dart';
import 'package:flutter/material.dart';

class TabNewsItemWidget extends StatelessWidget {
  const TabNewsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _buildScaffold(context);
  }

  _buildScaffold(BuildContext context) {
    return SizedBox(
      height: getHeight(190),
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
                        image: snap.data![index].image.toString(),
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
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
// SizedBox(
//       height: getHeight(190),
//       width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: getWidth(10.0),
//               vertical: getHeight(10.0),
//             ),
//             child: Container(
//               height: getHeight(160.0),
//               width: getWidth(308.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   getWidth(15.0),
//                 ),
//                 image: const DecorationImage(
//                   image: AssetImage(
//                     'assets/images/i.png',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
}

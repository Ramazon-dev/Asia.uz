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
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewsInitial) {
            return Scaffold(
              body: Loader.loader(),
            );
          } else if (state is NewsLoading) {
            return Scaffold(
              body: Loader.loader(),
            );
          } else if (state is NewsCompleted) {
            debugPrint("News title :${state.response[0].title}");
            return _buildScaffold(context, state);
          } else {
            final error = state as NewsError;
            return const Notifications()
                .flash(context, error.errorMessange, Colors.red);
          }
        },
      ),
    );
  }

  _buildScaffold(BuildContext context, NewsCompleted state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? buildMobile(context, state)
            : buildTab(context, state);
      },
    );
  }

  Scaffold buildMobile(BuildContext context, NewsCompleted state) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        text: 'Новости и акции'.tr(),
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
                  debugPrint("url: ${state.response[index].image}");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        image: state.response[index].image ??
                            "https://i.insider.com/61a91b0f5d47cc0018e90ed7?width=1136&format=jpeg",
                        title: state.response[index].title ?? "",
                        id: state.response[index].id.toString(),
                        discription: state.response[index].description ?? "",
                        created: state.response[index].createdAt.toString(),
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
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       state.response[index].image.toString()),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading_indicator.gif",
                            image: state.response[index].image.toString(),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
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

  Scaffold buildTab(BuildContext context, NewsCompleted state) {
    return Scaffold(
      backgroundColor: AppColors.unselectedColor,
      appBar: MyAppBar(
        textSize: 32,
        text: 'Новости и акции'.tr(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            height: getHeight(20),
            width: getWidth(30),
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
                horizontal: getWidth(30.0),
                vertical: getHeight(10.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        image: state.response[index].image ??
                            "https://i.insider.com/61a91b0f5d47cc0018e90ed7?width=1136&format=jpeg",
                        title: state.response[index].title ?? "",
                        id: state.response[index].id.toString(),
                        discription: state.response[index].description ?? "",
                        created: state.response[index].createdAt.toString(),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getWidth(15.0)),
                  child: Container(
                    padding: EdgeInsets.all(getHeight(38)),
                    color: AppColors.whiteColor,
                    height: getHeight(751.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                fontSize: getWidth(32.0),
                              ),
                            ),
                          ),
                        ).only(top: getHeight(10.0)),
                        Text(
                          "${state.response[index].updatedAt!.hour}: ${state.response[index].updatedAt!.minute}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: getWidth(25.0),
                          ),
                        ).only(bottom: getHeight(10)),
                        Container(
                          height: getHeight(522.0),
                          width: getWidth(674.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getWidth(18.0),
                            ),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading_indicator.gif",
                            image: state.response[index].image.toString(),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
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

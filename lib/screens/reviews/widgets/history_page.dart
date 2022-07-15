import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/service/api/get/feedbacks_my_service.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder<List<FeedbacksMyModel>>(
      future: FeedBacksMyService.getFeedbacksMyService(),
      builder: (context, AsyncSnapshot<List<FeedbacksMyModel>> snap) {
        if (snap.hasData) {
          if (snap.data!.isEmpty) {
            return historyIsEmptyMethod();
          } else {
            return Container(
              alignment: Alignment.topCenter,
              height: getHeight(800),
              width: double.infinity,
              margin: EdgeInsets.only(
                top: getHeight(5),
                left: getWidth(30),
                right: getWidth(30),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  if (snap.data!.isEmpty) {
                    return historyIsEmptyMethod();
                  } else {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: getHeight(10),
                        left: getWidth(3),
                        right: getWidth(3),
                      ),
                      padding: EdgeInsets.all(getHeight(10)),
                      // alignment: Alignment.center,
                      height: getHeight(100),
                      // width: getWidth(350),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(getHeight(15)),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.bgColor,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snap.data![index].type ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getHeight(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            snap.data![index].message ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getHeight(14),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            );
          }
        } else if (snap.hasError) {
          return historyIsEmptyMethod();
        }
         return Center(
            child: Image.asset(
              "assets/images/loading_indicator.gif",
              fit: BoxFit.cover,
              height: getHeight(70),
            ),
          );
      },
    );
  }

  Container historyIsEmptyMethod() {
    return Container(
      alignment: Alignment.center,
      height: getHeight(200.0),
      width: double.infinity,
      padding: EdgeInsets.all(getHeight(30)),
      margin: EdgeInsets.only(
        top: getHeight(30.0),
      ),
      child: Column(
        children: [
          SizedBox(height: getHeight(170.0)),
          Text(
            'История отзывов пуста.'.tr(),
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(20.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(18)),
          Text(
            'Вы можете оставить свой отзыв, перейдя в раздел “ Новый отзыв”.'
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.teal,
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: MyAppBar(
        text: 'Новости и акции',
        widget: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
        ),
        onTab: () {
          Navigator.pop(context);
        },
        onPress: () {},
        icon: const Icon(
          Icons.height,
          color: AppColors.orangeColor,
        ),
      ),
    );
  }
}

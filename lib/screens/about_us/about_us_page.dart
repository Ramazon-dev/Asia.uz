import 'package:asia_uz/core/components/view/my_app_bar.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "About us",
        widget: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
        ),
        onTab: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.transparent,
        ),
        onPress: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextWidget(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            textColor: AppColors.black,
            text: """Сеть супермаркетов
Asia.uz """,
          ).only(
            top: getHeight(30),
            left: getWidth(40),
          ),
          MyTextWidget(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            textColor: AppColors.black,
            text:
                """Asia.uz — успешно развивающаяся сеть супермаркетов. Мы объединяем традиции Азии и современный формат розничной торговли.

Начиная с 2017 года, наш список клиентов пополняется благодаря постоянно растущему ассортименту, наилучшему соотношению цены и качества товаров и сохранению стандартов обслуживания.

Asia.uz — качество во всём.""",
          ).symmetric(
            horizontal: getHeight(20),
            vertical: getHeight(30),
          ),
        ],
      ),
    );
  }
}

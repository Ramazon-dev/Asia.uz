import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bu page da asia uz xaqida malumotlar joylashgan boladi
    // bu joyda device ni qayta tekshiriladi agar xajmi mobile standartidan katta bolmasa
    // mobile layout ochiladi aks xolda tab

    // boshqa ozgarishlar yoq
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? buildMobileScaffold(context)
            : buildTabScaffold(context);
      },
    );
  }

  Scaffold buildTabScaffold(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "О нас".tr(),
        textSize: 36,
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
          color: AppColors.whiteColor,
        ),
        action: const Icon(
          Icons.arrow_back,
          color: Colors.transparent,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getHeight(50),
          ),
          MyTextWidget(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            textColor: AppColors.black,
            text: "Сеть супермаркетов Asia.uz".tr(),
          ).only(
            top: getHeight(30),
            left: getWidth(40),
          ),
          MyTextWidget(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            textColor: AppColors.black,
            text:
                """Asia.uz — успешно развивающаяся сеть супермаркетов. Мы объединяем традиции Азии и современный формат розничной торговли.
        
        Начиная с 2017 года, наш список клиентов пополняется благодаря постоянно растущему ассортименту, наилучшему соотношению цены и качества товаров и сохранению стандартов обслуживания.
        
        Asia.uz — качество во всём.""",
          ).symmetric(
            horizontal: getHeight(100),
            vertical: getHeight(70),
          ),
          const Spacer(),
          Image(
            image: const AssetImage(
              "assets/images/logo.png",
            ),
            height: getHeight(400),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Scaffold buildMobileScaffold(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "О нас".tr(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/arrow_back.png",
            color: AppColors.whiteColor,
          ),
          color: AppColors.whiteColor,
        ),
        action: const Icon(
          Icons.arrow_back,
          color: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTextWidget(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: AppColors.black,
              text: "Сеть супермаркетов Asia.uz".tr(),
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
            Image(
              image: const AssetImage(
                "assets/images/logo.png",
              ),
              height: getHeight(230),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

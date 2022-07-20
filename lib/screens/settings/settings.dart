import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isActiv = GetStorage().read("touchid") == "true" ? true : false;
  @override
  Widget build(BuildContext context) {
    // debugPrint(GetStorage().read("touchid"));
    return Scaffold(
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            color: AppColors.whiteColor,
            height: getHeight(15),
            width: getWidth(20),
          ),
          color: AppColors.whiteColor,
        ),
        action: IconButton(
          onPressed: () {},
          icon: Container(),
        ),
        text: "Настройки".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            GetStorage().read("hasBiometric") == "true"
                ? Column(
                    children: [
                      SizedBox(height: getHeight(10)),
                      ListTile(
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          "Использовать Touch ID".tr(),
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: getHeight(16),
                            fontWeight: FontWeight.w500,
                          ),
                        ).only(bottom: getHeight(10)),
                        subtitle: Text(
                          "Использовать Touch ID для быстрого входа в приложение?"
                              .tr(),
                        ),
                        trailing: Switch(
                          // focusColor: AppColors.drawerTextColor,
                          // hoverColor: AppColors.drawerTextColor,
                          // activeTrackColor: AppColors.drawerTextColor,
                          // inactiveTrackColor: AppColors.drawerTextColor,
                          activeColor: AppColors.orangeColor,
                          inactiveThumbColor: AppColors.drawerTextColor,
                          value: isActiv,
                          onChanged: (sda) {
                            isActiv = sda;
                            GetStorage().write("touchid", isActiv.toString());
                            debugPrint(
                                "isActive: ${GetStorage().read("touchid")}");
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(15)),
                      const Divider(
                        thickness: 1,
                        color: AppColors.teal,
                      ),
                    ],
                  )
                : Container(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              },
              child: Container(
                height: getHeight(60),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.teal,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Изменить ПИН-код".tr(),
                      style: TextStyle(
                        fontSize: getHeight(16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.teal,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeLanguagePage(),
                  ),
                );
              },
              child: Container(
                height: getHeight(60),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.teal,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Выберите язык".tr(),
                      style: TextStyle(
                        fontSize: getHeight(16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.teal,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getHeight(55)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                      "https://play.google.com/store/apps/details?id=uz.softcity.diamond_decor",
                    );
                    if (!await launchUrl(url)) throw "Could not launch $url";
                  },
                  child: SizedBox(
                    width: getWidth(100),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/icons/rate.png",
                          ),
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Оценить приложение".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(13),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Share.share(
                      "There will be link of this app to share https://asia.uz/",
                      subject: "Look at this!!!",
                    );
                  },
                  child: SizedBox(
                    width: getWidth(100),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/icons/share.png",
                          ),
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Поделиться приложением".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(13),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                      "https://play.google.com/store/apps/details?id=uz.softcity.diamond_decor",
                    );
                    if (!await launchUrl(url)) throw "Could not launch $url";
                  },
                  child: SizedBox(
                    width: getWidth(100),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/icons/info.png",
                          ),
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Информация о приложении".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(13),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getHeight(55)),
            Divider(
              endIndent: getWidth(30),
              indent: getWidth(30),
              thickness: 1,
              color: AppColors.teal,
            ),
            SizedBox(height: getHeight(40)),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse("tel:+998 (90) 962-1681");
                if (!await launchUrl(url)) throw "Could not launch $url";
              },
              child: Text(
                "+998 (90) 962-1681",
                style: TextStyle(
                  fontSize: getHeight(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: getHeight(8)),
            Text(
              "Служба поддержки".tr(),
              style: TextStyle(
                color: AppColors.drawerTextColor,
                fontSize: getHeight(12),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(40)),
            Text(
              'ООО "ASIA.UZ"',
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(8)),
            Text(
              "Version: 1.1.0",
              style: TextStyle(
                color: AppColors.drawerTextColor,
                fontSize: getHeight(12),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:asia_uz/tablet/settings/tab_change_language.dart';
import 'package:asia_uz/tablet/settings/tab_change_password.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabSettingsPage extends StatefulWidget {
  const TabSettingsPage({Key? key}) : super(key: key);

  @override
  State<TabSettingsPage> createState() => _TabSettingsPageState();
}

class _TabSettingsPageState extends State<TabSettingsPage> {
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
            height: getHeight(20),
            width: getWidth(30),
          ),
          color: AppColors.whiteColor,
        ),
        action: IconButton(
          onPressed: () {},
          icon: Container(),
        ),
        text: "Settings",
        textSize: getHeight(30),
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
                          "Использовать Touch ID",
                          style: TextStyle(fontSize: getHeight(25)),
                        ).only(bottom: getHeight(24)),
                        subtitle: Text(
                          "Использовать Touch ID для быстрого входа в приложение?",
                          style: TextStyle(fontSize: getHeight(20)),
                        ),
                        trailing: Switch(
                          // focusColor: AppColors.drawerTextColor,
                          // hoverColor: AppColors.drawerTextColor,
                          // activeTrackColor: AppColors.drawerTextColor,
                          // inactiveTrackColor: AppColors.drawerTextColor,
                          activeColor: AppColors.orangeColor,
                          inactiveThumbColor: AppColors.drawerTextColor,
                          splashRadius: 150,

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
                    builder: (context) => const TabChangePassword(),
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
                      "Изменить ПИН-код",
                      style: TextStyle(
                        fontSize: getHeight(24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.teal,
                      size: getHeight(30),
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
                    builder: (context) => const TabChangeLanguagePage(),
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
                      "Выберите язык",
                      style: TextStyle(
                        fontSize: getHeight(24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.teal,
                      size: getHeight(30),
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
                    width: getWidth(220),
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            "assets/icons/rate.png",
                          ),
                          height: getHeight(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Оценить приложение",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(25),
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
                    width: getWidth(220),
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            "assets/icons/share.png",
                          ),
                          height: getHeight(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Поделиться приложением",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(25),
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
                    width: getWidth(220),
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            "assets/icons/info.png",
                          ),
                          height: getHeight(80),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: getHeight(14)),
                        Text(
                          "Информация о приложении",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.drawerTextColor,
                            fontSize: getHeight(25),
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
              endIndent: getWidth(60),
              indent: getWidth(60),
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
                  fontSize: getHeight(25),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: getHeight(8)),
            Text(
              "Служба поддержки",
              style: TextStyle(
                color: AppColors.drawerTextColor,
                fontSize: getHeight(25),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(40)),
            Text(
              'ООО "ASIA.UZ"',
              style: TextStyle(
                fontSize: getHeight(25),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getHeight(8)),
            Text(
              "Version: 1.1.0",
              style: TextStyle(
                color: AppColors.drawerTextColor,
                fontSize: getHeight(25),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

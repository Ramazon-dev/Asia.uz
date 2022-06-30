import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Settings",
      ),
      body: Column(children: [
        ListTile(
          title: const Text(
            "Использовать Touch ID",
          ),
          subtitle: const Text(
            "Использовать Touch ID для быстрого входа в приложение?",
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
            ),
          ),
          onTap: () {},
        ),
      ]),
    );
  }
}

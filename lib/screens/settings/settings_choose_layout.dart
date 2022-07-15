import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class SettingsChooseLayout extends StatelessWidget {
  const SettingsChooseLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        debugPrint("tab screenga kirdi");
        return const TabSettingsPage();
      }
      debugPrint("mobile setting screenga kirdi");
      return const SettingsPage();
    });
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/view/auth/info/bonus.dart';
import 'package:asia_uz/tablet/auth/info/tab_bonus.dart';
import 'package:flutter/material.dart';

class ChooseLayoute extends StatelessWidget {
  const ChooseLayoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        debugPrint("tab screenga kirdi");
        return const TabBonusPage();
      }
      return const BonusPage();
    });
  }
}

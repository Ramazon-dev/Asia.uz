import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class ChooseLayoute extends StatelessWidget {
  const ChooseLayoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        debugPrint("tab screenga kirdi");
        return const TabProfilePage();
      }
      return const ProfilePage();
    });
  }
}

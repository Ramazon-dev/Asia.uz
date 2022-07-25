import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class TabPersonalCard extends StatelessWidget {
  const TabPersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(340),
      width: getWidth(520),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/personal_card.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

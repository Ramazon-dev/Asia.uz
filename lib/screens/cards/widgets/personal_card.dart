import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "carta ikinchisi ${GetStorage().read("pythicalCardEncrypted").toString()}");
    return Container(
      height: getHeight(188),
      width: getWidth(293),
      padding: EdgeInsets.only(top: getHeight(100)),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/personal_card.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        GetStorage().read("pythicalCardEncrypted") ?? "",
        style: TextStyle(
          fontSize: getHeight(18),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabMyAppBar extends StatelessWidget with PreferredSizeWidget {
  TabMyAppBar({
    Key? key,
    this.text,
    this.leading,
    this.action,
    this.textSize = 20,
  }) : super(key: key);
  String? text;
  double textSize;
  Widget? leading, action;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            height: getHeight(120),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leading ?? Container(),
                  Center(
                    child: Text(
                      text!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: getWidth(textSize),
                        fontWeight: FontWeight.w700,
                      ),
                    ).only(top: getHeight(13)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: getHeight(3)),
                    child: action ?? Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        getWidth(327.0),
        getHeight(80.0),
      );
}

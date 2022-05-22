import 'package:flutter/material.dart';
import '../../imports/imports.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key? key,
    this.text,
    // this.onTab,
    this.leading,
    // this.onPress,
    this.action,
  }) : super(key: key);

  String? text;
  // VoidCallback? onTab, onPress;
  Widget? leading, action;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Positioned(
          // top: -2,
          // left: -4,
          // right: -1,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: getHeight(100),
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
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leading ?? Container(),
                  Center(
                    child: Text(
                      text!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: getWidth(20.0),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
    // Container(
    //   height: getHeight(100),
    //   width: MediaQuery.of(context).size.width,
    //   decoration: BoxDecoration(
    //     color: const Color(0xffF07F1C),
    //     image: const DecorationImage(
    //       image: AssetImage(
    //         "assets/images/appbar_bg.png",
    //       ),
    //       fit: BoxFit.cover,
    //     ),
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(getHeight(15)),
    //       bottomRight: Radius.circular(getHeight(15)),
    //     ),
    //   ),
    // );
    // AppBar(
    //   toolbarHeight: 100,
    //   backgroundColor: AppColors.orangeColor,
    //   elevation: 1,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(
    //         getWidth(15.0),
    //       ),
    //       bottomRight: Radius.circular(
    //         getWidth(15.0),
    //       ),
    //     ),
    //   ),
    //   leading: leading ?? Container(),
    //   title: Container(
    //     alignment: Alignment.center,
    //     width: getWidth(300.0),
    //     child: Text(
    //       text!,
    //       style: TextStyle(
    //         color: AppColors.whiteColor,
    //         fontSize: getWidth(20.0),
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    //   actions: [
    //     action ?? Container(),
    //   ],
    // );
  }

  @override
  Size get preferredSize => Size(
        getWidth(327.0),
        getHeight(80.0),
      );
}

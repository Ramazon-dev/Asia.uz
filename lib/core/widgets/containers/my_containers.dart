import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MyContainer extends StatelessWidget {
  MyContainer({
    Key? key,
    required this.child,
    this.alignment,
    this.height,
    this.width,
    this.colors,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  Widget child;
  double? width, height, radius, allMargin;
  Alignment? alignment;
  Color? colors, borderColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: alignment,
      height: getHeight(height!),
      width: getWidth(width!),
      child: child,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(
          getWidth(radius!),
        ),
      ),
    );
  }
}

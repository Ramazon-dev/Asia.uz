import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class IsLoadingWidget extends StatefulWidget {
  bool isload;
  IsLoadingWidget({Key? key, required this.isload}) : super(key: key);

  @override
  State<IsLoadingWidget> createState() => _IsLoadingWidgetState();
}

class _IsLoadingWidgetState extends State<IsLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isload == false) {
      return Center(
        child: Image.asset(
          "assets/images/loading_indicator.gif",
          fit: BoxFit.cover,
          color: AppColors.orange,
          height: getHeight(70),
        ),
      );
    } else {
      return IsLoadingWidget(isload: true);
    }
  }
}

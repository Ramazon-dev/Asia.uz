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
        child: CircularProgressIndicator(strokeWidth: getHeight(50)),
      );
    } else {
      return IsLoadingWidget(isload: true);
    }
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheetWidget extends StatefulWidget {
  const ShowModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheetWidget> createState() =>
      _ShowModalBottomSheetWidgetState();
}

class _ShowModalBottomSheetWidgetState
    extends State<ShowModalBottomSheetWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: getHeight(325),
      width: getWidth(375),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getHeight(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          children: [
            MyTextFormFiels(controller: controller),
          ],
        ),
      ),
    );
  }
}

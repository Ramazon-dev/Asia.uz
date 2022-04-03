import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/services.dart';

class MyTextFormFiels extends StatelessWidget {
  MyTextFormFiels({
    Key? key,
    required this.controller,
    this.radius,
    this.hintText,
    this.labelText,
    this.prefixText,
    this.prefixIcon,
    this.obscureText,
    this.sideColor,
    this.sideWidth,
    this.inputFormatters,
  }) : super(key: key);

  TextEditingController controller;
  double? radius, sideWidth;
  String? hintText, labelText, prefixText;
  Widget? prefixIcon;
  bool? obscureText;
  Color? sideColor;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: inputFormatters,
      obscureText: obscureText!,
      controller: controller,
      decoration: _decoration(),
    );
  }

  _decoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getWidth(radius!),
        ),
        borderSide: BorderSide(
          width: getWidth(sideWidth!),
          color: sideColor!,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      prefixText: prefixText,
      prefixStyle: TextStyle(
        color: AppColors.black,
        fontSize: getWidth(16.0),
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: prefixIcon,
    );
  }
}

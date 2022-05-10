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
    this.onChanged,
    this.validator,
  }) : super(key: key);

  TextEditingController controller;
  double? radius, sideWidth;
  String? hintText, labelText, prefixText;
  Widget? prefixIcon;
  bool? obscureText;
  Color? sideColor;
  List<TextInputFormatter>? inputFormatters;
  Function(String)? onChanged;
  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
textAlign: TextAlign.start,
      // cursorHeight: 30,showCursor: false,
      // scrollPadding: EdgeInsets.only(top: 20),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: inputFormatters,
      obscureText: obscureText!,
      controller: controller,
      decoration: _decoration(),
      onChanged: onChanged,
      validator: validator,
    );
  }

  _decoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.only(),
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      filled: true,
      fillColor: Colors.white,
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.orangeColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.orangeColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
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

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
    this.inputTextSize = 16,
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
  double inputTextSize;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: inputTextSize,
        color: AppColors.black
      
      ),
      textAlign: TextAlign.start,
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
      contentPadding: const EdgeInsets.only(),
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
      hintStyle: TextStyle(
        color: AppColors.black,
        fontSize: getWidth(16.0),
        fontWeight: FontWeight.w400,
      ),
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

import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';


class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final GlobalKey<FormState> validateKey;
  final TextEditingController smsController;
  VerifyCodeCubit(this.validateKey, this.smsController)
      : super(const VerifyCodeInitial());

  bool isActive = false;

  void onTab() {
    if (validateKey.currentState!.validate()) {
    } else {
      isActive = true;
      emit(VerifyCodeValidateState(isActive));
    }
  }
}

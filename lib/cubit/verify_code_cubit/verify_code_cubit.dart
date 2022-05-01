import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/service/api/post/verify_code_service.dart';
import 'package:flutter/material.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final GlobalKey<FormState> validateKey;
  final TextEditingController smsController;
  VerifyCodeCubit(this.validateKey, this.smsController)
      : super(const VerifyCodeInitial());

  bool isActive = false;

  Future onTab() async {
    if (validateKey.currentState!.validate()) {
      await VerifyCodeService.verifyCodeService(
          int.parse(smsController.text), GetStorage().read('telNumber'));
    } else {
      isActive = true;
      emit(VerifyCodeValidateState(isActive));
    }
  }
}

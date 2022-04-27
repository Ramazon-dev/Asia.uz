import 'package:asia_uz/service/api/post/verify_number_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> formKey;
  TextEditingController phoneNumberController;

  bool isValidateState = false;

  AuthCubit(this.formKey, this.phoneNumberController)
      : super(const AuthInitial());

  void login() async {
    if (formKey.currentState!.validate()) {
      VerifyNumberService.verifyNumberService(
        int.parse(phoneNumberController.text),
      );
    } else {
      isValidateState = true;
      AuthValidateState(isValidateState);
    }
  }

  void clear(){
    phoneNumberController.clear();
  }
}

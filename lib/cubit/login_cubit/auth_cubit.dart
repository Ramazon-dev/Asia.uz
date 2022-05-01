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

  Future login(String number) async {
    if (formKey.currentState!.validate()) {
      await VerifyNumberService.verifyNumberService(number);
    } else {
      isValidateState = true;
      emit(AuthValidateState(isValidateState));
    }
  }

  void clear() {
    phoneNumberController.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> formKey;
  TextEditingController phoneNumberController;

  bool isValidateState = false;

  AuthCubit(this.formKey, this.phoneNumberController) : super(AuthInitial());

  void login() async {
    if (formKey.currentState!.validate()) {
    } else {
      isValidateState = true;
      AuthValidateState(isValidateState);
    }
  }
}

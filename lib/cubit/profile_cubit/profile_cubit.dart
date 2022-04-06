import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with Disposable {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController surnameController;

  final TextEditingController dataBirthController;
  final TextEditingController floorController;

  final TextEditingController seminalPositionController;
  final TextEditingController employmentController;
  final TextEditingController phoneNumberController;

  final TextEditingController homePhoneNumberController;
  final TextEditingController homeSecondPhoneNumberController;
  final TextEditingController emailController;
  final TextEditingController notificationController;
  final TextEditingController languageController;

  bool isValidate = false;

  ProfileCubit(
    this.formKey,
    this.nameController,
    this.surnameController,
    this.dataBirthController,
    this.floorController,
    this.seminalPositionController,
    this.employmentController,
    this.phoneNumberController,
    this.homePhoneNumberController,
    this.homeSecondPhoneNumberController,
    this.emailController,
    this.notificationController,
    this.languageController,
  ) : super(ProfileInitial());

  Future<void> close() {
    dispose();
    return super.close();
  }

  void clear() {
    nameController.clear();
    surnameController.clear();
    dataBirthController.clear();
    floorController.clear();
    seminalPositionController.clear();
    employmentController.clear();
    phoneNumberController.clear();
    homePhoneNumberController.clear();
    homeSecondPhoneNumberController.clear();
    emailController.clear();
    notificationController.clear();
    languageController.clear();
  }

  void validateState(){
    if(formKey.currentState!.validate()){

    } else {
      isValidate = true;
      ProfileValidateState(isValidate);
    }
  }

}

mixin Disposable on Object {
  void dispose() {}
}

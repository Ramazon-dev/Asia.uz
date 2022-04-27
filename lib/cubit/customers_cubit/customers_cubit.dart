import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/customers_cubit/customers_state.dart';
import 'package:asia_uz/service/api/get/customers_api_services.dart';
import 'package:asia_uz/service/api/post/customers_service.dart';
import 'package:flutter/cupertino.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final GlobalKey<FormState> validateState;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController landlineController;
  final TextEditingController backupPhoneController;
  final TextEditingController dopController;
  final bool materialState;
  final TextEditingController gemderController;
  final TextEditingController occupationController;
  final TextEditingController notificationPreferenceController;
  final TextEditingController notificationLanguageController;
  final CustomersRepository customersRepository;
  CustomersCubit(
    this.customersRepository,
    this.validateState,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.landlineController,
    this.backupPhoneController,
    this.dopController,
    this.materialState,
    this.gemderController,
    this.occupationController,
    this.notificationPreferenceController,
    this.notificationLanguageController,
  ) : super(const CustomersInitial()) {
    getCustomers();
  }

  bool isValidateState = false;

  Future<void> getCustomers() async {
    try {
      emit(const CustomersLoading());
      await Future.delayed(const Duration(seconds: 3));
      final response = await customersRepository.getCustomersDate();
      emit(CustomersCompledet(response));
    } catch (e) {
      emit(CustomersError(e.toString()));
    }
  }

  void postCuspomers() async {
    if (validateState.currentState!.validate()) {
      CuspomersServices.cuspomersService(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        landlineController.text,
        backupPhoneController.text,
        dopController.text,
        materialState,
        gemderController.text,
        occupationController.text,
        notificationPreferenceController.text,
        notificationLanguageController.text,
      );
    } else {
      isValidateState = true;
      emit(CuspomersValidateState(isValidateState));
    }
  }
}

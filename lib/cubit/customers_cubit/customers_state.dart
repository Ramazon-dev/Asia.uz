import 'package:asia_uz/core/model/get/customers_api_model.dart';
import 'package:flutter/foundation.dart';

abstract class CustomersState {
  const CustomersState();
}

class CustomersInitial extends CustomersState {
  const CustomersInitial();
}

class CustomersLoading extends CustomersState {
  const CustomersLoading();
}

class CustomersCompledet extends CustomersState {
  final List<CustomersApiModel> response;

  const CustomersCompledet(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomersCompledet && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class CustomersError extends CustomersState {
  final String errorMessage;
  const CustomersError(this.errorMessage);
}

class CuspomersValidateState extends CustomersState {
  final bool isValidateState;
  const CuspomersValidateState(this.isValidateState);
}

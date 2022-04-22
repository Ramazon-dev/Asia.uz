import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/customers_cubit/customers_state.dart';
import 'package:asia_uz/service/api/get/customers_api_services.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final CustomersRepository customersRepository;
  CustomersCubit(this.customersRepository) : super(const CustomersInitial()) {
    getCustomers();
  }

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
}

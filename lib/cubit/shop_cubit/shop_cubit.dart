// import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/shop_cubit/shop_cubit_state.dart';
import 'package:asia_uz/service/api/get/shop_api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState>{
  final ShopRepository shopRepository;
  ShopCubit(this.shopRepository) : super(const ShopInitial()){
    getShop();
  }

  Future<void> getShop() async {
    try {
      emit(const ShopLoading());
      await Future.delayed(const Duration(seconds: 3));
      final response = await shopRepository.getDateFromApi();
      emit(ShopCompledet(response));
    } catch (e) {
      emit(ShopError(e.toString()));
    }
  }

}

  

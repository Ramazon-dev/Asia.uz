import 'package:asia_uz/core/imports/imports.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopRepository shopRepository;
  ShopCubit(this.shopRepository) : super(const ShopInitial()) {
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

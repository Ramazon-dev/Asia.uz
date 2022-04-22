import 'package:asia_uz/core/model/get/shop_api_model.dart';
import 'package:flutter/foundation.dart';

abstract class ShopState {
  const ShopState();
}

class ShopInitial extends ShopState {
  const ShopInitial();
}

class ShopLoading extends ShopState {
  const ShopLoading();
}

class ShopCompledet extends ShopState {
  final List<ShopsApiModel> response;

  const ShopCompledet(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ShopCompledet && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class ShopError extends ShopState {
  final String errorMessage;
  const ShopError(this.errorMessage);
}

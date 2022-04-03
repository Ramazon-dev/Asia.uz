import 'package:flutter/cupertino.dart';

class OnPressProvider extends ChangeNotifier {
  void onPress() {
    notifyListeners();
  }
}

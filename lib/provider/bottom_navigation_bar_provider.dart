import 'package:flutter/cupertino.dart';
import 'package:asia_uz/core/imports/imports.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const ShopsPage(),
    const ReviewsPage(),
     CardsPage(),
  ];


  set currentTab(int tab) {
    _currentIndex = tab;
    notifyListeners();
  }

  int get currentTab => _currentIndex;
  get currentScreens => _screens[_currentIndex];
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/tablet/main/cards/tab_cards_page.dart';
import 'package:asia_uz/tablet/main/home/tab_home_page.dart';
import 'package:asia_uz/tablet/main/reviews/tab_reviews_page.dart';
import 'package:asia_uz/tablet/main/shop/tab_shops_page.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int _tabcurrentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const ShopsPage(),
    const ReviewsPage(),
    const CardsPage(),
  ];
  final List<Widget> _tabcreens = [
    const TabHomePage(),
    TabShopsPage(),
    const TabReviewsPage(),
    const TabCardsPage(),
  ];

  set currentTab(int tab) {
    _currentIndex = tab;
    notifyListeners();
  }

  set tabcurrentTab(int tab) {
    _tabcurrentIndex = tab;
    notifyListeners();
  }

  int get currentTab => _currentIndex;
  get currentScreens => _screens[_currentIndex];

  int get tabcurrentTab => _tabcurrentIndex;
  get tabCurrentScreens => _tabcreens[_tabcurrentIndex];
}

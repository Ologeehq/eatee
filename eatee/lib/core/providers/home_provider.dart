import 'package:eatee/core/models/user_model.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:eatee/ui/views/food/food_screen.dart';
import 'package:eatee/ui/views/market/market_screen.dart';
import 'package:flutter/material.dart';

class HomeProvider extends BaseProvider {
  UserModel currentUser;
  int currentIndex = 0;
  List<Widget> _body = [
    FoodScreen(
      key: PageStorageKey('foodScreen'),
    ),
    MarketScreen(
      key: PageStorageKey('marketScreen'),
    ),
    FoodScreen(
      key: PageStorageKey('accountScreen'),
    )
  ];
  List<Widget> get body => _body;
  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeState() {
    notifyListeners();
  }
}

import 'dart:async';

import 'package:eatee/core/models/food/food.dart';
import 'package:eatee/core/models/food/restaurant_model.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:flutter/material.dart';

class FoodProvider extends BaseProvider {
  PageController controller;
  static List<Food> foods = [];
  List<String> _foodSliderImages = [
    'assets/images/food1.png',
    'assets/images/glocery.png',
    'assets/images/fruit.png',
  ];
  List<String> get foodSliderImages => _foodSliderImages;

  List<Restaurant> _restaurants = [
    Restaurant(
      name: "Charcoal",
      foods: foods,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/eatee-app.appspot.com/o/charcoal.png?alt=media&token=205d84df-e281-410d-9f52-93713d18cf0d",
      phone: "08135315557",
      rating: 3,
      location: "Tanke Junction Round About",
      openingTime: "8am-6pm (Everyday)",
    ),
    Restaurant(
      name: "Chicken Republic",
      foods: foods,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/eatee-app.appspot.com/o/chicken.png?alt=media&token=b56e2199-306d-497d-ba0d-6fc884380f64",
      phone: "08056237263",
      rating: 4,
      location: "G.R.A Ilorin Kwara",
      openingTime: "8am-6pm (Everyday)",
    ),
    Restaurant(
      name: "Item 7",
      foods: foods,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/eatee-app.appspot.com/o/item7.png?alt=media&token=6bedf7e1-1ab8-440d-9a5f-5321459da40b",
      phone: "07014235169",
      rating: 5,
      location: "Ibrahim Taiwo Road",
      openingTime: "8am-6pm (Everyday)",
    ),
  ];
  List<Restaurant> get restaurants => _restaurants;

  Timer timer;
  int currentIndex = 0;
  void increaseIndex(int len) {
    if (currentIndex < len) {
      currentIndex++;
      notifyListeners();
    } else {
      currentIndex = 0;
      notifyListeners();
    }
  }
}

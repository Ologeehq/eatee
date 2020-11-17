import 'dart:async';

import 'package:eatee/core/models/slide_model.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:flutter/material.dart';

class IntroProvider extends BaseProvider {
  PageController pageController = PageController();
  int _currentPage = 0;
  Timer timer;
  List<SlideModel> _slides = [
    SlideModel(
        title: 'Market',
        imageUrl: 'assets/images/slide.png',
        description:
            'lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor'),
    SlideModel(
        title: 'Food',
        imageUrl: 'assets/images/slide2.png',
        description:
            'lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor'),
    SlideModel(
        title: 'Door Step Delivery',
        imageUrl: 'assets/images/slide3.png',
        description:
            'lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor lorem ipsum donor'),
  ];
  List<SlideModel> get slides => _slides;
  int get currentPage => _currentPage;
  void slidePage() {
    pageController.animateToPage(_currentPage,
        duration: Duration(microseconds: 1500), curve: Curves.easeIn);
    notifyListeners();
  }

  void nextButtonAction() {
    if (_currentPage < slides.length - 1) {
      _currentPage++;
      notifyListeners();
      slidePage();
    } else {
      _currentPage = 0;
      notifyListeners();
      slidePage();
    }
  }

  void nextPage(int page) {
    _currentPage = page;
    notifyListeners();
    slidePage();
  }
}

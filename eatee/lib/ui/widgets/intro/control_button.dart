import 'package:eatee/ui/widgets/intro/indicator.dart';
import 'package:flutter/material.dart';

Widget controlButtons(int _slideIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: <Widget>[
          _slideIndex == 0 ? Indicator(active: true) : Indicator(active: false),
          _slideIndex == 1 ? Indicator(active: true) : Indicator(active: false),
          _slideIndex == 2 ? Indicator(active: true) : Indicator(active: false),
        ],
      ),
    ],
  );
}

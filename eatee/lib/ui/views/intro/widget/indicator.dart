import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  Indicator({this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 18.0 : 8.0,
      height: active ? 6.0 : 8.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : kIndicatorInactiveColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

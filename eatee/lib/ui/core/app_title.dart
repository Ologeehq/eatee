import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  AppTitle({this.innerApp = false});
  final bool innerApp;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Eatee',
      style: innerApp
          ? kHeadingText2.copyWith(color: kPrimaryColor)
          : kHeadingText1.copyWith(color: kPrimaryColor),
    );
  }
}

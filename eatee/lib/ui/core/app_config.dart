import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static const String app_name = "Eatee";
  static const int app_version_code = 1;
  static const Color app_color = kPrimaryColor;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

import 'package:eatee/locator.dart';
import 'package:eatee/ui/core/app_base_widget.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: kPrimaryColor,
  ));

  await Firebase.initializeApp();
  setUp();
  runApp(AppBaseWidget());
}

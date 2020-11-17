import 'package:auto_route/auto_route.dart';
import 'package:eatee/ui/core/app_config.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';

import 'package:flutter/material.dart';

class AppBaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: AppConfig.app_name,
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder<AutoRouter>(router: AutoRouter()),
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          backgroundColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color(0xffEBF1EF),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

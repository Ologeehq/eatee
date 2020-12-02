// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../views/food/food_cart_screen.dart';
import '../views/food/food_detail_screen.dart';
import '../views/food/payment_review_screen.dart';
import '../views/food/restuarant_screen.dart';
import '../views/home/home_screen.dart';
import '../views/intro/intro_screen.dart';
import '../views/login/login_screen.dart';
import '../views/profile_setting/profile_settings_screen.dart';
import '../views/signup/signup_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/welcome/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String introScreen = '/intro-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String signupScreen = '/signup-screen';
  static const String loginScreen = '/login-screen';
  static const String homeScreen = '/home-screen';
  static const String profileScreen = '/profile-screen';
  static const String restaurantScreen = '/restaurant-screen';
  static const String foodDetailScreen = '/food-detail-screen';
  static const String foodCartScreen = '/food-cart-screen';
  static const String paymentReviewScreen = '/payment-review-screen';
  static const all = <String>{
    splashScreen,
    introScreen,
    welcomeScreen,
    signupScreen,
    loginScreen,
    homeScreen,
    profileScreen,
    restaurantScreen,
    foodDetailScreen,
    foodCartScreen,
    paymentReviewScreen,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.introScreen, page: IntroScreen),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.signupScreen, page: SignupScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.restaurantScreen, page: RestaurantScreen),
    RouteDef(Routes.foodDetailScreen, page: FoodDetailScreen),
    RouteDef(Routes.foodCartScreen, page: FoodCartScreen),
    RouteDef(Routes.paymentReviewScreen, page: PaymentReviewScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    IntroScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => IntroScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    WelcomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WelcomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SignupScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ProfileScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProfileScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    RestaurantScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RestaurantScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    FoodDetailScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FoodDetailScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    FoodCartScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FoodCartScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    PaymentReviewScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PaymentReviewScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
  };
}

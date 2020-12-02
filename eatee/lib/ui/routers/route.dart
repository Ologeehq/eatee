import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:eatee/ui/views/food/food_cart_screen.dart';
import 'package:eatee/ui/views/food/food_detail_screen.dart';
import 'package:eatee/ui/views/food/payment_review_screen.dart';
import 'package:eatee/ui/views/food/restuarant_screen.dart';
import 'package:eatee/ui/views/home/home_screen.dart';
import 'package:eatee/ui/views/intro/intro_screen.dart';
import 'package:eatee/ui/views/login/login_screen.dart';
import 'package:eatee/ui/views/profile_setting/profile_settings_screen.dart';
import 'package:eatee/ui/views/signup/signup_screen.dart';
import 'package:eatee/ui/views/splash/splash_screen.dart';
import 'package:eatee/ui/views/welcome/welcome_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    CustomRoute(
        page: IntroScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: WelcomeScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SignupScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: LoginScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: HomeScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ProfileScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: RestaurantScreen,
        transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(
        page: FoodDetailScreen, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: FoodCartScreen, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: PaymentReviewScreen,
        transitionsBuilder: TransitionsBuilders.slideBottom)
  ],
)
class $AutoRouter {}

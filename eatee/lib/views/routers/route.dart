import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:eatee/views/screens/intro/intro_screen.dart';
import 'package:eatee/views/screens/login/login_screen.dart';
import 'package:eatee/views/screens/splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    CustomRoute(
        page: IntroScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: LoginScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AutoRouter {}

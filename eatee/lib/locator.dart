import 'package:eatee/core/helpers/auth_helper.dart';
import 'package:eatee/core/providers/food_provider.dart';
import 'package:eatee/core/providers/home_provider.dart';
import 'package:eatee/core/providers/intro_provider.dart';
import 'package:eatee/core/providers/manage_user.dart';
import 'package:eatee/core/providers/market_provider.dart';
import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/core/providers/signin_provider.dart';
import 'package:eatee/core/providers/signup_provider.dart';
import 'package:eatee/core/services/authentication.dart';
import 'package:eatee/ui/views/splash/splash_screen.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton(() => SplashScreen());
  locator.registerLazySingleton(() => ManageUserProvider());
  locator.registerLazySingleton(() => IntroProvider());
  locator.registerLazySingleton(() => SignupProvider());
  locator.registerLazySingleton(() => SigninProvider());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirebaseAuthHelper());
  locator.registerLazySingleton(() => HomeProvider());
  locator.registerLazySingleton(() => FoodProvider());
  locator.registerLazySingleton(() => RestaurantProvider());
  locator.registerLazySingleton(() => MarketProvider());
}

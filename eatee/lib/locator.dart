import 'package:eatee/core/providers/intro_provider.dart';
import 'package:eatee/core/providers/manage_user.dart';
import 'package:eatee/core/providers/signin_provider.dart';
import 'package:eatee/core/providers/signup_provider.dart';
import 'package:eatee/ui/views/splash/splash_screen.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton(() => SplashScreen());
  locator.registerLazySingleton(() => ManageUserProvider());
  locator.registerLazySingleton(() => IntroProvider());
  locator.registerLazySingleton(() => SignupProvider());
  locator.registerLazySingleton(() => SigninProvider());
}

import 'package:aksana_getx/bindings/app_binding.dart';
import 'package:aksana_getx/screens/home_screen.dart';
import 'package:aksana_getx/screens/landing_screen.dart';
import 'package:aksana_getx/screens/login_screen.dart';
import 'package:aksana_getx/screens/register_screen.dart';
import 'package:aksana_getx/screens/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashScreen = "/spashScreen";
  static const String landingScreen = "/landingScreen";
  static const String homeScreen = "/homeScreen";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";

  static List<GetPage> get routes => [
        GetPage(
          name: splashScreen,
          page: () {
            return SplashScreen();
          },
        ),
        GetPage(
            name: landingScreen,
            page: () => LandingScreen(),
            binding: AppBinding()),
        GetPage(name: homeScreen, page: () => HomeScreen()),
        GetPage(name: loginScreen, page: () => LoginScreen()),
        GetPage(name: registerScreen, page: () => RegisterScreen())
      ];
}

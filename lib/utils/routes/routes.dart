import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/signin_screen.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreenPage());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreenPage());
      case RoutesName.sigin:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Text("Route not defined"),
          );
        });
    }
  }
}

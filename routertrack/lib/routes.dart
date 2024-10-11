import 'package:flutter/material.dart';
// import 'package:routertrack/screens/home.dart';
import 'package:routertrack/screens/logIn.dart';
// import 'package:routertrack/screens/signUp.dart';
import 'package:routertrack/screens/splash.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String logInScreen = '/log_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String homePage = '/home_page';
  static const String roomScreen = '/room_screen';
  static const String profileScreen = '/profile_screen';
  static const String createRoom = '/create_room_bottom_sheet';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    logInScreen: (context) => const LogInScreen(),
    // signUpScreen: (context) => SignUpScreen(),
    // homePage: (context) => HomePage(),
  };
}
// routes.dart
import 'package:flutter/material.dart';
import 'package:jalyuzi/view/home_page.dart';
import 'package:jalyuzi/view/login_page.dart';
import 'package:jalyuzi/view/onboarding_page.dart';
import 'package:jalyuzi/view/signup_view.dart';
import 'package:jalyuzi/view/splash_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';





  // Yo'nalishlarni yaratish
  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => HomePage(),
      login: (context) => LoginPage(),
      signup: (context) => SignupPage(),
      splash: (context) => SplashScreen(),
      onboarding: (context) => OnboardingPage(),

    };
  }
}

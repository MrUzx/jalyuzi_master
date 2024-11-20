import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalyuzi/theme/dark_theme.dart';
import 'package:jalyuzi/theme/light_theme.dart';
import 'package:jalyuzi/view/splash_page.dart';
import 'package:provider/provider.dart';
import 'view_model/login_viewmodel.dart';
import 'view_model/signup_viewmodel.dart';
import 'view_model/theme_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        // ChangeNotifierProvider(create: (_) => SplashViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme_provider = Provider.of<ThemeViewModel>(context);
    return GetMaterialApp(
      theme: theme_provider.isDarkMode ? darkTheme : lightTheme, // Temani o'zgartirish
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

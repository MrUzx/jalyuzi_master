import 'package:flutter/material.dart';
import 'package:jalyuzi/model/company_model.dart';
import 'package:jalyuzi/service/splash_service.dart';
import 'package:jalyuzi/view/company_selection.dart';
import 'package:jalyuzi/view/home_page.dart';
import 'package:jalyuzi/view/login_page.dart';
import 'package:jalyuzi/view/onboarding_page.dart';
import 'package:jalyuzi/view/signup_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashApiService _apiService = SplashApiService();

  // @override
  // void initState() {
  //   super.initState();
  //   _checkFirstVisit();
  // }

  Future<void> _checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstVisit = prefs.getBool('isFirstVisit') ?? true;

    if (isFirstVisit) {
      prefs.setBool('isFirstVisit', false);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: OnboardingPage(),
          ),
        );
      });
    } else {
      await Future.delayed(Duration(seconds: 3)); // 3 soniya kutish
      await _navigateBasedOnApi();
    }
  }

  Future<void> _navigateBasedOnApi() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    print("User ID: $userId");

    if (userId != null) {
      try {
        // API'dan ma'lumot olish
        SplashResponse response = await _apiService.fetchSplashData(userId);

        // API javobini to'g'ri chiqarish
        print("API Response Data: ${response.data}");
        print("API Error Status: ${response.error}");

        if (response.error == true) {
          // API orqali xatolik bo'lsa, Login sahifasiga yo'naltirish
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: LoginPage(),
            ),
          );
        } else {
          // API javobidagi data ni tekshirib chiqish
          final userCompanyId = response.data?.userCompanyId ?? "0";
          print("User Company ID: $userCompanyId");

          if (userCompanyId == "0") {
            // Kompaniyani tanlash sahifasiga yo'naltirish
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: CompanySelectionPage(),
              ),
            );
          } else {
            // Home sahifasiga yo'naltirish
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: HomePage(),
              ),
            );
          }
        }
      } catch (e) {
        print('API xato: $e');
        // Agar API orqali xato bo'lsa, Login sahifasiga yo'naltirish
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: LoginPage(),
          ),
        );
      }
    } else {
      // Agar user_id mavjud bo'lmasa, Signup sahifasiga yo'naltirish
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: SignupPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.svg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 200,
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Jalyuzi',
                    style: TextStyle(
                      color: Color(0xFFFCA311),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Master',
                    style: TextStyle(
                      color: Color(0xFF14123D),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

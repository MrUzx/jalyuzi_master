import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalyuzi/service/login_service.dart';
import 'package:jalyuzi/SharedPreferences/user_info.dart';
import 'package:jalyuzi/view/splash_page.dart';
import 'package:page_transition/page_transition.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService _loginService = LoginService();
  final SharedPreferencesService _prefsService = SharedPreferencesService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Parolni yashirish/ko'rsatish
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  // Foydalanuvchini tizimga kirgizish
  Future<void> loginUser(
      String phoneNumber, String password, BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return; // Forma noto'g'ri bo'lsa qaytadi
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Map<String, String>? userData =
          await _loginService.login(phoneNumber, password);

      if (userData != null) {
        // Foydalanuvchi ma'lumotlarini saqlash
        await _prefsService.saveUserData(
          userData['user_id']!,
          userData['user_name']!,
          userData['user_phone']!,
          password,
        );

        print("Login muvaffaqiyatli!");
        print(
          userData['user_id']!,
        );
        // Splash sahifaga o'tish
        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: SplashScreen()));

      } else {
        _errorMessage = 'Telefon raqam yoki parol noto\'g\'ri';
        Get.snackbar('Xatolik', _errorMessage!);
      }
    } catch (e) {
      _errorMessage = 'Tizimga kirishda xatolik: $e';
      Get.snackbar('Xatolik', _errorMessage!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

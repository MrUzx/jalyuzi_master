import 'package:flutter/material.dart';
import 'package:jalyuzi/SharedPreferences/user_info.dart';
import 'package:jalyuzi/service/signup_service.dart';
import 'package:jalyuzi/view/company_selection.dart';

class SignupViewModel extends ChangeNotifier {
  final SignupService _signupService = SignupService();
  final SharedPreferencesService _prefsService = SharedPreferencesService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  final GlobalKey<FormState> formKeySignUP = GlobalKey<FormState>(); // Form key

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Parolni ko'rsatish va yashirish
  bool _obscureText = true; // Bu yerda _obscureText ni aniqlaymiz

  bool get obscureText => _obscureText; // getter, value ni olish

  void togglePasswordVisibility() {
    _obscureText = !_obscureText; // Parolni ko'rsatish va yashirish
    notifyListeners(); // Bu yordamida UI yangilanadi
  }

  // Foydalanuvchi ma'lumotlarini ro'yxatdan o'tkazish
  Future<void> signUpUser(String name, String phoneNumber,BuildContext context,
      String password) async {
    if (!formKeySignUP.currentState!.validate()) {
      return; // Agar forma noto'g'ri to'ldirilgan bo'lsa, davom etmaymiz
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Map<String, String>? userData = await _signupService.signUp(
          name, phoneNumber, password);

      if (userData != null) {
        // Foydalanuvchi ma'lumotlarini saqlash
        await _prefsService.saveUserData(
          userData['user_id']!,
          userData['user_name']!,
          userData['user_phone']!,
          password,
        );
        print("otikkkkk");
        // Uy sahifasiga o'tish
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanySelectionPage()));
      } else {
        _errorMessage = 'Ro\'yxatdan o\'tishda xatolik yuz berdi';
      }
    } catch (e) {
      _errorMessage = 'Ro\'yxatdan o\'tish amalga oshmadi:';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
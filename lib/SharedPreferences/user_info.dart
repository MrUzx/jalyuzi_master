import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Save user data
  Future<void> saveUserData(String userId, String name, String phone, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    await prefs.setString('user_name', name);
    await prefs.setString('user_phone', phone);
  }

  // Load user data
  Future<Map<String, String?>> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    String? userName = prefs.getString('user_name');
    String? userPhone = prefs.getString('user_phone');
    return {
      'user_id': userId,
      'user_name': userName,
      'user_phone': userPhone,
    };
  }

  // Clear user data
  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('user_name');
    await prefs.remove('user_phone');
  }

  // Check if the user is logged in (based on phone number being stored)
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user_phone');
  }
}

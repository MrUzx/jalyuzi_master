import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jalyuzi/model/company_model.dart';

class SplashApiService {
  /// Splash API orqali foydalanuvchini tekshirish
  Future<SplashResponse> fetchSplashData(String userId) async {
    final url = Uri.parse('https://jalyuzi.alzacloud.uz/api/splash.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': userId,
        }),
      );
      final json = jsonDecode(response.body);

      // Status code tekshiruvi
      if (json['error'] == false) {
        // Response body bo'sh bo'lsa ham tekshirish
        if (response.body.isNotEmpty) {

          // JSONni to'g'ri formatda dekodlash va ma'lumotlarni print qilish
          print("Response JSON: $json");

          // JSONni SplashResponse modeliga o'tkazish
          return SplashResponse.fromJson(json);
        } else {
          throw Exception('Response body is empty');
        }
      } else {
        // Serverdan muvaffaqiyatsiz javob olinganda
        throw Exception('Failed to fetch user data: ${response.statusCode}');
      }
    } catch (e) {
      // Xatoliklar uchun umumiy boshqaruv
      throw Exception('Failed to fetch user data: $e');
    }
  }
}

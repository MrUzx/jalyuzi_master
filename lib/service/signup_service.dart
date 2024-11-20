import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupService {
  // Ro'yxatdan o'tish
  Future<Map<String, String>?> signUp(String name, String phone_number, String password) async {
    final url = Uri.parse('https://jalyuzi.alzacloud.uz/api/registration.php');

    try {
      // So'rovni yuborish
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_name': name,
          'user_phone': phone_number,
          'user_password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['error'] == false) {
          // API javobidan foydalanuvchi ma'lumotlarini olish
          final userData = responseBody['data'];
          return {
            'user_id': userData['user_id'].toString(),
            'user_name': userData['user_name'],
            'user_phone': userData['user_phone']
          };
        } else {
          print('Xato: ${responseBody['message']['uz']}');
          return null;
        }
      } else {
        print('Xato: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Xato: $e');
      return null;
    }
  }
}

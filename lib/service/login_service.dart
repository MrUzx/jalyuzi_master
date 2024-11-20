import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  Future<Map<String, String>?> login(String phoneNumber, String password) async {
    final url = Uri.parse('https://jalyuzi.alzacloud.uz/api/login.php');

    try {
      // So'rov yuborish
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_phone': phoneNumber,
          'user_password': password,
        }),
      );
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {

        if (responseBody['error'] == false) {
          // Foydalanuvchi ma'lumotlarini olish
          final userData = responseBody['data'];
          return {
            'user_id': userData['user_id'].toString(),
            'user_name': userData['user_name'],
            'user_phone': userData['user_phone'],
          };
        } else {
          print('Xato: ${responseBody['message']['uz']}');
          return null;
        }
      } else {
        print('Server xatosi: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('So\'rov xatosi: $e');
      return null;
    }
  }
}

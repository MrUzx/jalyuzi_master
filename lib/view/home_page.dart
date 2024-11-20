import 'package:flutter/material.dart';
import 'package:jalyuzi/SharedPreferences/user_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // SharedPreferencesService instance yaratish
  final SharedPreferencesService _sharedPreferencesService = SharedPreferencesService();

  // Foydalanuvchi ma'lumotlarini saqlash uchun o'zgaruvchilar
  String? userId;
  String? userName;
  String? userPhone;
  String? userPassword;

  @override
  void initState() {
    super.initState();
    // Foydalanuvchi ma'lumotlarini yuklash
    _loadUserData();
  }

  // Foydalanuvchi ma'lumotlarini SharedPreferences'dan olish
  Future<void> _loadUserData() async {
    Map<String, String?> userData = await _sharedPreferencesService.loadUserData();

    setState(() {
      userId = userData['user_id'];
      userName = userData['user_name'];
      userPhone = userData['user_phone'];
      userPassword = userData['user_password'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: userId == null || userName == null || userPhone == null
          ? Center(child: CircularProgressIndicator()) // Ma'lumotlar yuklanmoqda
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: $userId', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('User Name: $userName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('User Phone: $userPhone', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('User Password: $userPassword', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

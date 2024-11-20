import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
      BuildContext context, String message, Color backgroundColor) {
    final snackBar = SnackBar(

      content: Text(
        textAlign: TextAlign.center,
        message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

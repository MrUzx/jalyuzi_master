// custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function()? onVisibilityToggle;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool isPasswordField;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onVisibilityToggle,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 24,
                ),
                onPressed: onVisibilityToggle,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool showPasswordToggle;
  final Function()? onPasswordToggle;
  final bool showError;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.onPasswordToggle,
    this.showError = false,
    this.onChanged,
    this.emailValidator,
    this.passwordValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.white38,
            fontFamily: 'Secondary'
        ),
        suffixIcon: showPasswordToggle
            ? IconButton(
          icon: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
          onPressed: onPasswordToggle,
        )
            : null,
      ),
      validator: (value) {
        if (showError && (value == null || value.isEmpty)) {
          return 'Please enter $hintText';
        }

        if (hintText.toLowerCase() == 'email' && emailValidator != null) {
          return emailValidator!(value);
        } else if (hintText.toLowerCase() == 'password' && passwordValidator != null) {
          return passwordValidator!(value);
        }

        return null;
      },
      onChanged: onChanged,
    );
  }
}

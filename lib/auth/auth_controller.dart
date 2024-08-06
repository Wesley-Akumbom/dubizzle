import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLogin = ValueNotifier<bool>(true);
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void setEmail(String? value) => _email = value ?? '';
  void setPassword(String? value) => _password = value ?? '';
  void setConfirmPassword(String? value) => _confirmPassword = value ?? '';

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (!isLogin.value && _password != value) {
      return 'Passwords do not match.';
    }
    return validatePassword(value);
  }

  void toggleAuthMode() {
    isLogin.value = !isLogin.value;
  }

  Future<void> trySubmit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        if (isLogin.value) {
          await _authService.signIn(_email, _password);
        } else {
          await _authService.signUp(_email, _password);
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }
  }
}

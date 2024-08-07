import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLogin = true;
  bool _isLoading = false;

  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;

  void toggleAuthMode() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> submitAuth(String email, String password, [String? confirmPassword]) async {
    setLoading(true);
    try {
      if (_isLogin) {
        await _authService.signIn(email, password);
      } else {
        if (confirmPassword != null && password != confirmPassword) {
          throw FirebaseAuthException(
            code: 'passwords-do-not-match',
            message: 'Passwords do not match!',
          );
        }
        await _authService.signUp(email, password);
      }
    } finally {
      setLoading(false);
    }
  }

  String getErrorMessage(String code) {
    return _authService.getMessageFromErrorCode(code);
  }
}

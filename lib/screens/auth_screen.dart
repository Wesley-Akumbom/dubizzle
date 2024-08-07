import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../auth/auth_form.dart';
import '../auth/auth_view_model.dart';
import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  AuthScreen({Key? key}) : super(key: key);

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _trySubmit(BuildContext context, AuthViewModel viewModel) async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (isValid) {
      final formData = _formKey.currentState!.value;
      final email = formData['email'] as String?;
      final password = formData['password'] as String?;
      final confirmPassword = formData['confirm_password'] as String?;

      if (email == null || password == null) {
        _showErrorToast('Email and password are required.');
        return;
      }

      try {
        await viewModel.submitAuth(email, password, confirmPassword);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (error) {
        if (error is FirebaseAuthException) {
          _showErrorToast(viewModel.getErrorMessage(error.code));
        } else {
          _showErrorToast('An error occurred. Please try again.');
        }
      }
    } else {
      _showErrorToast('Please correct the errors in the form.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                viewModel.isLogin ? 'Sign In' : 'Sign Up',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: !viewModel.isLogin,
              backgroundColor: Colors.redAccent,
              centerTitle: true,
            ),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthForm(
                    isLogin: viewModel.isLogin,
                    formKey: _formKey,
                    onSubmit: () => _trySubmit(context, viewModel),
                  ),
                  TextButton(
                    onPressed: viewModel.toggleAuthMode,
                    child: Text(viewModel.isLogin
                        ? 'Create a new account'
                        : 'I already have an account'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

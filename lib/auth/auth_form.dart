import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../services/validation_service.dart';

class AuthForm extends StatelessWidget {
  final bool isLogin;
  final GlobalKey<FormBuilderState> formKey;
  final VoidCallback onSubmit;

  const AuthForm({
    Key? key,
    required this.isLogin,
    required this.formKey,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormBuilderTextField(
            name: 'email',
            decoration: const InputDecoration(labelText: 'Email address'),
            validator: ValidationService.validateEmail,
          ),
          FormBuilderTextField(
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: ValidationService.validatePassword,
          ),
          if (!isLogin)
            FormBuilderTextField(
              name: 'confirm_password',
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              validator: (value) => ValidationService.validateConfirmPassword(
                value,
                formKey.currentState?.fields['password']?.value ?? '',
              ),
            ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: onSubmit,
            child: Text(
                isLogin ? 'Login' : 'Sign Up',
                style: const TextStyle(
                  color: Colors.black
                ),
            ),
          ),
        ],
      ),
    );
  }
}

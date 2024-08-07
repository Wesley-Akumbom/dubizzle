import 'package:form_builder_validators/form_builder_validators.dart';

class ValidationService {
  static String? validateEmail(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.email(),
    ])(value);
  }

  static String? validatePassword(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.minLength(6),
    ])(value);
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return validatePassword(value);
  }
}

import 'package:eatee/core/helpers/validation_helper.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:flutter/material.dart';

class SigninProvider extends BaseProvider {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  String _email;
  String _password;
  bool _hidePassword = true;

  String get email => _email;
  String get password => _password;
  bool get hidePassword => _hidePassword;
  
  String validateFields(String value) =>
      FormValidationHelper.validateEmptyField(value);

  String validateEmail(String email) =>
      FormValidationHelper.validateEmail(email);

  void saveEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void savePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void toggleHidePassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }
}

import 'package:eatee/core/enum/form_field.dart';
import 'package:eatee/core/helpers/validation_helper.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:flutter/material.dart';

class SignupProvider extends BaseProvider {
  String _email;
  String _fullname;
  String _phone;
  String _password;
  bool _hidePassword = true;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  GlobalKey<ScaffoldState> _signupKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String get fullname => _fullname;
  String get email => _email;
  String get phone => _phone;
  String get password => _password;
  bool get hidePassword => _hidePassword;

  GlobalKey<ScaffoldState> get scaffoldKey => _signupKey;
  GlobalKey<FormState> get formKey => _formKey;
  void showError(BuildContext context, String msg) {
    _signupKey.currentState.showSnackBar(
      SnackBar(
        content: Text(msg ?? ''),
        backgroundColor: Theme.of(context).errorColor,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void saveField(FormFields fields, String value) {
    switch (fields) {
      case FormFields.email:
        _email = value;
        notifyListeners();
        break;
      case FormFields.fullname:
        _fullname = value;
        notifyListeners();
        break;
      case FormFields.phone:
        _phone = value;
        notifyListeners();
        break;
      case FormFields.password:
        _password = value;
        notifyListeners();
        break;
    }
  }

  void toggleHidePassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  void updatePassword(String val) {
    _password = val;
    notifyListeners();
  }

  String validateEmail(String email) =>
      FormValidationHelper.validateEmail(email);

  String validateEmptyField(String value) =>
      FormValidationHelper.validateEmptyField(value);
  String validatePassword(String value) =>
      FormValidationHelper.validatePassword(value);
  String validatePasswordMatched({String pwd1, String pwd2}) =>
      FormValidationHelper.isPasswordMatched(pwd1, pwd2);
}

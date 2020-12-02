import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/enum/form_field.dart';
import 'package:eatee/core/helpers/auth_helper.dart';
import 'package:eatee/core/helpers/user_helper.dart';
import 'package:eatee/core/helpers/validation_helper.dart';
import 'package:eatee/core/models/user_model.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:eatee/core/providers/manage_user.dart';
import 'package:eatee/core/services/connectivity.dart';
import 'package:eatee/locator.dart';
import 'package:eatee/ui/core/show_loading_dialog.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:flutter/material.dart';

class SignupProvider extends BaseProvider {
  String _email;
  String _fullname;
  String _phone;
  String _password;
  bool _hidePassword = true;
  final _manageUser = locator<ManageUserProvider>();
  GlobalKey<ScaffoldState> _signupKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firebaseAuthHelper = locator<FirebaseAuthHelper>();
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

  Future<void> createAccount(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    final connection = await ConnectivityService.isConnectedToInternet();
    if (connection != null) {
      final res = await _firebaseAuthHelper.createAccountEmailPassword(
          email: _email, password: _password);
      if (res != null) {
        res.fold((l) {
          Navigator.of(context).pop();
          _signupKey.currentState.showSnackBar(
            SnackBar(
              content: Text(l ?? ''),
              duration: Duration(seconds: 5),
              backgroundColor: Colors.redAccent,
            ),
          );
        }, (r) {
          final _user = UserModel(
              id: r.uid,
              fullName: _fullname,
              email: _email,
              phone: _phone,
              imageUrl:
                  'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/45.png');
          UserFirestoreHelper.createUser(_user).then((_) {
            _manageUser.updateRegisteredUser(true);
            Navigator.of(context).pop();
            _signupKey.currentState.showSnackBar(
              SnackBar(
                content: Text('User account created successfully!'),
                duration: Duration(seconds: 4),
                backgroundColor: Colors.green,
              ),
            );
            ExtendedNavigator.of(context)
                .pushAndRemoveUntil(Routes.homeScreen, (route) => false);
          });
        });
      }
    } else {
      Navigator.of(context).pop();
      _signupKey.currentState.showSnackBar(
        SnackBar(
          content: Text('No Internet Connection!!!'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/helpers/auth_helper.dart';
import 'package:eatee/core/helpers/validation_helper.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:eatee/core/services/connectivity.dart';
import 'package:eatee/locator.dart';
import 'package:eatee/ui/core/show_loading_dialog.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:eatee/core/providers/manage_user.dart';

class SigninProvider extends BaseProvider {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  final authHelper = locator<FirebaseAuthHelper>();
  String _email;
  String _password;
  bool _hidePassword = true;
  final _manageUser = locator<ManageUserProvider>();
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

  Future<void> loginUser(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    //check for internet connectivity
    final connectivity = await ConnectivityService.isConnectedToInternet();
    if (connectivity != null) {
      authHelper
          .loginAccountEmail(email: _email, password: _password)
          .then((value) {
        value.fold((l) {
          Navigator.of(context).pop();
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(l ?? ''),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.redAccent,
            ),
          );
        }, (r) {
          _manageUser.populateCurrentUser(r).then((_) {
            Navigator.of(context).pop();
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('User logged In!'),
                duration: Duration(seconds: 4),
                backgroundColor: Colors.greenAccent,
              ),
            );
            ExtendedNavigator.of(context)
                .pushAndRemoveUntil(Routes.homeScreen, (route) => false);
          });
        });
      });
    } else {
      //stop loading indicator
      Navigator.of(context).pop();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('No internet connectivity!'),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}

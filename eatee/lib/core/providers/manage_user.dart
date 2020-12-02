import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatee/core/enum/status.dart';
import 'package:eatee/core/enum/view_state.dart';
import 'package:eatee/core/models/user_model.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageUserProvider extends BaseProvider {
  Status _status = Status.Initializing;
  Status get status => _status;
  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future<void> isNewUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool res = pref.getBool('registered');
    if (res == null) {
      setState(ViewState.busy);
      Future.delayed(Duration(seconds: 2), () {
        _status = Status.Unauthenticated;
        notifyListeners();
        setState(ViewState.ready);
      });
    } else if (res) {
      _status = Status.Authenticated;
      notifyListeners();
      setState(ViewState.ready);
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();
      setState(ViewState.ready);
    }
  }

  Future<void> updateRegisteredUser(bool state) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('registered', state);
  }

  Future<void> populateCurrentUser(User user) async {
    final _doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    final loggedInUser = _doc.data();
    _currentUser = UserModel.fromData(loggedInUser);
  }

  
}

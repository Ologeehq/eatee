import 'package:eatee/core/enum/status.dart';
import 'package:eatee/core/enum/view_state.dart';
import 'package:eatee/core/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageUserProvider extends BaseProvider {
  Status _status = Status.Initializing;
  Status get status => _status;

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
}

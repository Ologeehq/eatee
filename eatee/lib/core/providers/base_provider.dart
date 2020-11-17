import 'package:eatee/core/enum/view_state.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _viewState;
  ViewState get viewState => _viewState;
  void setState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}

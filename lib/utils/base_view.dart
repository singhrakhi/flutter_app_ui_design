import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/enums/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
  }

  void update() {
    notifyListeners();
  }
}

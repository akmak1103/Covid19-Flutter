import 'package:flutter/widgets.dart';

import '../enums/viewState.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;

    //notify all the listeners in the app that data has changed
    notifyListeners();
  }
}
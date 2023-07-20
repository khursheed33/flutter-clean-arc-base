import 'package:flutter/cupertino.dart';

import '../../../core/enums/view_state.dart';

abstract class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Done;

  ViewState get state => _state;

  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void disposeModel();
}

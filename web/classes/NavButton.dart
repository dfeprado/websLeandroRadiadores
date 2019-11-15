import 'dart:html';

import 'SectionNavigator.dart';

class NavButton {
  AnchorElement _button;
  SectionNavigator _navigator;
  Function _doMore = null;
  
  void _Navigate(MouseEvent e) {
    _navigator.Navigate();
    if (_doMore != null)
      _doMore(e);
  }

  NavButton(this._button, this._navigator) {
    _button.onClick.listen(_Navigate);
  }

  void set OnNavigation(Function f) => _doMore = f;
}
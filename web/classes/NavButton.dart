import 'dart:html';

import 'SectionNavigator.dart';

class NavButton {
  AnchorElement _button;
  SectionNavigator _navigator;

  NavButton(this._button, this._navigator) {
    _button.onClick.listen((MouseEvent e) => _navigator.Navigate());
  }
}
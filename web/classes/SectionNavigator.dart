import 'dart:html';

import 'ToolBar.dart';

class SectionNavigator {
  ToolBar _navBar;
  String _secao;

  SectionNavigator(this._secao, this._navBar) {}

  void Navigate() {
    // window.scrollTo(0, _offsetY, {'behavior':'smooth'});
    window.scroll({'top':window.document.querySelector(_secao).offsetTop - _navBar.height, 'left': 0, 'behavior':'smooth'});
  }

  static Map<String, SectionNavigator> sections = Map<String, SectionNavigator>();
}
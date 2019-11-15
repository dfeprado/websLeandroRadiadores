import 'dart:html';

class SectionNavigator {
  int _offsetY;

  SectionNavigator(this._offsetY) {}

  void Navigate() {
    // window.scrollTo(0, _offsetY, {'behavior':'smooth'});
    window.scroll({'top':_offsetY, 'left': 0, 'behavior':'smooth'});
  }

  static Map<String, SectionNavigator> sections = Map<String, SectionNavigator>();
}
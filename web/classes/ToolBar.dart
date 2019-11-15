import 'dart:html';

class ToolBar {
  HtmlElement _navBar;

  void _ToggleFixed(Event e) {
    if (window.scrollY > 0 && !_navBar.classes.contains('w3-top')) {
      _navBar.classes.add('w3-top');
    }
    else if (window.scrollY == 0) {
      _navBar.classes.remove('w3-top');
    }
  }

  ToolBar(this._navBar) {
    window.onScroll.listen(_ToggleFixed);
  }

  int get height => _navBar.clientHeight;
}
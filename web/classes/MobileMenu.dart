import 'dart:html';

import 'NavButton.dart';
import 'SectionNavigator.dart';

class MobileMenu {
  Map<String, NavButton> _buttons = Map<String, NavButton>();
  HtmlElement _menu;

  void _toggle(MouseEvent e) {
    _menu.style.display == 'block' ?
      _menu.style.display = 'none' :
      _menu.style.display = 'block';
  }

  MobileMenu(Map<String, SectionNavigator> sections) {
    _menu = window.document.querySelector('#menuMobile');

    // botões de navegação
    _buttons['serviços'] = NavButton(
      window.document.querySelector('#btnServicosMobile'),
      sections['serviços']
    ).. 
      OnNavigation = this._toggle;

    _buttons['contatos'] = NavButton(
      window.document.querySelector('#btnContatosMobile'),
      sections['contatos']
    ).. 
      OnNavigation = this._toggle;

    _buttons['sobre'] = NavButton(
      window.document.querySelector('#btnSobreMobile'),
      sections['sobre']
    ).. 
      OnNavigation = this._toggle;

    // botões do menu
    window.document.querySelector('#btnFecharMenuMobile').onClick.listen(_toggle);
    window.document.querySelector('#btnAbrirMenuMobile').onClick.listen(_toggle);
  }
}
import 'dart:html';

import 'NavButton.dart';
import 'SectionNavigator.dart';

class DesktopMenu {
  Map<String, NavButton> _buttons = Map<String, NavButton>();

  DesktopMenu(Map<String, SectionNavigator> navigators) {
    _buttons['serviços'] = NavButton(
      window.document.querySelector('#btnServicos'),
      navigators['serviços']
    );

    _buttons['contatos'] = NavButton(
      window.document.querySelector('#btnContatos'),
      navigators['contatos']
    );

    _buttons['sobre'] = NavButton(
      window.document.querySelector('#btnSobre'),
      navigators['sobre']
    );
  }
}
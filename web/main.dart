import 'dart:html';

import 'classes/TopicoServico.dart';
import 'classes/ToolBar.dart';
import 'classes/SectionNavigator.dart';
import 'classes/DesktopMenu.dart';

void main() {
  // instancia o objeto de menu
  ToolBar navBar = ToolBar(window.document.getElementsByTagName('header')[0]);

  // instancia os tópicos de serviços
  ElementList<HeadingElement> servicos = querySelectorAll('.lr-servico');
  servicos.forEach((HeadingElement h) => TopicoServico.topicos.add(TopicoServico(h)));

  // configuração de ações de navegações e menus
  // cria os navegadores de seções
  SectionNavigator.sections['serviços'] = 
    SectionNavigator(window.document.querySelector('#secaoDescricaoServicos').offsetTop - navBar.height*2);

  SectionNavigator.sections['contatos'] = 
    SectionNavigator(window.document.querySelector('#secaoContatos').offsetTop - navBar.height);

  SectionNavigator.sections['sobre'] = 
    SectionNavigator(window.document.querySelector('#secaoSobreLeandroRadiadores').offsetTop - navBar.height);

  // Menu do desktop
  DesktopMenu desktopMenu = DesktopMenu(SectionNavigator.sections);

  // Menu do mobile

}

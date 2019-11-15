import 'dart:html';

import 'classes/MobileMenu.dart';
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
    SectionNavigator('#secaoDescricaoServicos', navBar);

  SectionNavigator.sections['contatos'] = 
    SectionNavigator('#secaoContatos', navBar);

  SectionNavigator.sections['sobre'] = 
    SectionNavigator('#secaoSobreLeandroRadiadores', navBar);

  // Menu do desktop
  DesktopMenu desktopMenu = DesktopMenu(SectionNavigator.sections);

  // Menu do mobile
  MobileMenu mobileMenu = MobileMenu(SectionNavigator.sections);

  // datas
  DateTime hoje = DateTime.now();
  Duration existencia = hoje.difference(DateTime(2009, 09, 26));

  window.document.querySelector('#idadeOficina').innerText = (existencia.inDays/365).round().toString();
  window.document.querySelector('#anoAtual').innerText = hoje.year.toString();

}

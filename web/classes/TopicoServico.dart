import 'dart:html';

class TopicoServico {
  HeadingElement _topico;
  HtmlElement _container;
  HtmlElement _section;
  Element _icone;

  void _ToggleHidden(MouseEvent e) {
    // Esse trecho garante que apenas um tópico ficará aberto por vez!
    TopicoServico.topicos.forEach((TopicoServico t) {
      if (t.IsOpen && t != this) t.Toggle();
    });

    // abre/fecha o tópico
    this.Toggle();
  }

  TopicoServico(this._topico) {
    _container = _topico.parent;
    _icone = _topico.children[0];
    _section = _container.children.last;
    _topico.onClick.listen(this._ToggleHidden);
  }

  void Toggle() {
    _section.classes.toggle('w3-hide');

    if (_icone.classes.contains('fa-plus')) {
      _icone.classes ..
        remove('fa-plus') ..
        add('fa-minus');
    }
    else {
      _icone.classes ..
        remove('fa-minus') ..
        add('fa-plus');
    }
    
  }

  bool get IsOpen => !_section.classes.contains('w3-hide');

  // relação de todos os tópicos
  static List<TopicoServico> topicos = List<TopicoServico>();
}
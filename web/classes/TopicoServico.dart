import 'dart:html';

class TopicoServico {
  HeadingElement _topico;
  HtmlElement _container;
  HtmlElement _section;

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
    _section = _container.children.last;
    _topico.onClick.listen(this._ToggleHidden);
  }

  void Toggle() {
    _section.classes.toggle('w3-hide');
  }

  bool get IsOpen => !_section.classes.contains('w3-hide');

  // relação de todos os tópicos
  static List<TopicoServico> topicos = List<TopicoServico>();
}
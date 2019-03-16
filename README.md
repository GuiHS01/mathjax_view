# mathjax_view

Flutter Math Rendering Widget by MathJax.js

## How to use

This is simple widget, and you can set text and text size (px).

```dart
SizedBox(
  width: 300,
  height: 200,
  child: MathjaxView(
    onMathjaxViewCreated: _onMathjaxViewCreated,
    fontSize: 20,
  ),
),
...
void _onMathjaxViewCreated(MathjaxViewController _controller) {
  controller = _controller;
  controller.setLatexText(
      'This is set test \$4x - 2y\\frac{4}{2x}=0\$ <br /> 日本語もいける');
}
```

import 'package:flutter/material.dart';
import 'package:mathjax_view/mathjax_view.dart';
//import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MathjaxViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SizedBox(
              width: 300,
              height: 200,
              child: MathjaxView(
                onMathjaxViewCreated: _onMathjaxViewCreated,
                fontSize: 20,
              )),
        ),
      ),
    );
  }

  void _onMathjaxViewCreated(MathjaxViewController _controller) {
    controller = _controller;
    controller.setLatexText(
        'This is set test \$4x - 2y\\frac{4}{2x}=0\$ <br /> 日本語もいける');
  }
}

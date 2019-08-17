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
  MathjaxServer server;

  @override
  void initState() {
    super.initState();
    server.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 200,
                child: MathjaxView(
                  onMathjaxViewCreated: _onMathjaxViewCreated,
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  print('on pressed $controller');
                  controller.setLatexText(
                      '\$\\begin{split}&t=e^x+1~,\\quad e^x = t-1,\\quad e^x\\,dx=dt\\\\&\\begin{split}&\\int \\frac{e^{2x}}{(e^x+1)^2}\\,dx\\\\&= \\int \\frac{t-1}{t^2}\\,dt\\\\&= \\int\\left(\\frac{1}{t}-\\frac{1}{t^2}\\right)dt\\\\&= \\log |t|+\\frac{1}{t}+C\\\\&= { \\log (e^x+1)+\\frac{1}{e^x+1}+C }\\end{split}\\end{split}\$');
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('変えて'),
              ),
              MaterialButton(
                onPressed: () {
                  print('on pressed $controller');
                  controller.setLatexText(
                      'This is set test \$4x - 2y\\frac{4}{2x}=0\$ <br /> 日本語もいける');
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('戻す'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onMathjaxViewCreated(MathjaxViewController _controller) {
    controller = _controller;
    controller.setLatexText(
        '\$\\begin{split}&t=e^x+1~,\\quad e^x = t-1,\\quad e^x\\,dx=dt\\\\&\\begin{split}&\\int \\frac{e^{2x}}{(e^x+1)^2}\\,dx\\\\&= \\int \\frac{t-1}{t^2}\\,dt\\\\&= \\int\\left(\\frac{1}{t}-\\frac{1}{t^2}\\right)dt\\\\&= \\log |t|+\\frac{1}{t}+C\\\\&= { \\log (e^x+1)+\\frac{1}{e^x+1}+C }\\end{split}\\end{split}\$');
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void MathjaxViewCreatedCallback(MathjaxViewController controller);

class MathjaxView extends StatefulWidget {
  MathjaxView({
    Key key,
    this.onMathjaxViewCreated,
  }) : super(key: key);

  final MathjaxViewCreatedCallback onMathjaxViewCreated;

  @override
  State<StatefulWidget> createState() => _MathjaxViewState();
}

class _MathjaxViewState extends State<MathjaxView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'com.dev.touyou/mathjax_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'com.dev.touyou/mathjax_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }

    return Text(
        '$defaultTargetPlatform is not yet supported by the mathjax_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onMathjaxViewCreated == null) {
      return;
    }

    widget.onMathjaxViewCreated(MathjaxViewController._(id));
  }
}

class MathjaxViewController {
  MathjaxViewController._(int id)
      : _channel = new MethodChannel('com.dev.touyou/mathjax_view_$id');

  final MethodChannel _channel;

  Future<void> setLatexText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setLatexText', text);
  }
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathjax_view/mathjax_view.dart';

void main() {
  const MethodChannel channel = MethodChannel('mathjax_view');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MathjaxView.platformVersion, '42');
  });
}

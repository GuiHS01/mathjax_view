# mathjax_view

Flutter Math Rendering Widget by MathJax.js

## Install

Add `pubspec.yaml` dependencies.

```
mathjax_view: ^0.1.2
```

then run the `flutter packages get`

Next, open `ios/Runner.xcworkspace`.
Change Podfile like this

```ruby
target 'Runner' do
  # Prepare symlinks folder. We use symlinks to avoid having Podfile.lock
  # referring to absolute paths on developers' machines.
  use_frameworks! # add this line

  system('rm -rf .symlinks')
  system('mkdir -p .symlinks/plugins')
```

and this

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['SWIFT_VERSION'] = '5.0' # add this line
    end
  end
end
```

Finally, move `Info.plist`, and add `io.flutter.embedded_views_preview` as Boolean, set the value to YES.

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

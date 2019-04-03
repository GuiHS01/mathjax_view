#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'mathjax_view'
  s.version          = '0.0.8'
  s.summary          = 'Flutter Math Rendering Widget supported by mathjax'
  s.description      = <<-DESC
Flutter math rendering widget by mathjax. For flutter.
                       DESC
  s.homepage         = 'http://touyou.github.io'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'touyou' => 'touyou.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.swift_version = '5.0'

  s.ios.deployment_target = '8.0'
end

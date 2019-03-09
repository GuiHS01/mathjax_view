import Flutter
import UIKit

public class SwiftMathjaxViewPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mathjax_view", binaryMessenger: registrar.messenger())
    let instance = SwiftMathjaxViewPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "render_mathjax" {
      let arguments = call.arguments as! [String: Any]
      guard let text = arguments["text"] as? String else {
        result(FlutterError.init(code: "ArgumentError", message: "Required argument does not exist.", details: nil));
        return
      }

      let controller: FlutterViewController = UIApplication.shared.keyWindow?.rootViewController as! FlutterViewController


      // result("iOS " + UIDevice.current.systemVersion)
    }
  }

  private func mathJaxScript() -> String {
    return "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"
  }

  private func configScript() -> String {
    return "<script type=\"text/x-mathjax-config\">"
               + "MathJax.Hub.Config({jax: [\"input/TeX\",\"output/HTML-CSS\"], tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]} , \"HTML-CSS\": {linebreaks: {automatic: true}}});"
               + "</script>"
  }

  private func contentHtml(with latexString: String) -> String {
    let header = configScript() + mathJaxScript()
    return "<html><header>\(header)</header><body>\(latexString)</body></html>"
  }
}

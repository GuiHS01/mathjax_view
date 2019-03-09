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
}

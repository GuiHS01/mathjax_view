import Flutter
import UIKit

public class SwiftMathjaxViewPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.register(MathjaxViewFactory(messenger: registrar.messenger() as? (NSObject & FlutterBinaryMessenger)), withId: "com.dev.touyou/mathjax_view")
    }
}

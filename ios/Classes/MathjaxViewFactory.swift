import UIKit
import Flutter

public class MathjaxViewFactory: NSObject, FlutterPlatformViewFactory {
    var messenger: FlutterBinaryMessenger!
    
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        ) -> FlutterPlatformView {
        return MathjaxView(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
    
    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init()
        self.messenger = messenger
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

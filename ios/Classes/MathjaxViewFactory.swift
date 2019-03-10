import UIKit
import Flutter

public class MathjaxViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        ) -> FlutterPlatformView {
        return MathjaxView(frame, viewId: viewId, args: args)
    }
}

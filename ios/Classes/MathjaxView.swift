import UIKit
import Flutter

public class MathjaxView: NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64

    var channel: FlutterMethodChannel!
    private var _fontSize: Int?
    private var texView: UIWebView!

    init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        self.frame = frame
        self.viewId = viewId
        super.init()

        let params = args as! NSDictionary
        self._fontSize = params["fontSize"] as? Int

        self.channel = FlutterMethodChannel(name: "com.dev.touyou/mathjax_view_\(viewId)", binaryMessenger: binaryMessenger)
        self.channel.setMethodCallHandler {
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { return }

            self.onMethodCall(call: call, result: result)
        }
    }

    public func view() -> UIView {
        texView = UIWebView(frame: frame)
        texView.backgroundColor = UIColor.clear
        texView.isOpaque = false

        texView.loadHTMLString(contentHtml(with: "Please set text", fontSize: _fontSize), baseURL: nil)
        return texView
    }

    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setLatexText":
            setLatexText(call: call, result: result)
        default:
            result(FlutterError(code: "404", message: "Not Implemented Method Call", details: nil))
        }
    }

    private func setLatexText(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let latexString = call.arguments as! String
        texView.loadHTMLString(contentHtml(with: latexString, fontSize: _fontSize), baseURL: nil)
        result(nil)
    }

    // MARK: - Mathjax Logic

    private func mathJaxScript() -> String {
        return "<script async src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML&locale=ja'></script>"
//        return "<script src='MathJax-2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML&locale=ja'></script>"
    }

    private func configScript() -> String {
        return #"""
        <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
            showMathMenu: false,
            MathMenu: {
                showRenderer: false
            },
            messageStyle: "none",
            "HTML-CSS": {linebreaks: {automatic: true}}});
        </script>
        """#
    }

    private func styleScript(_ fontSize: Int?) -> String {
        return "<style>body { font-size: \(fontSize ?? 28)px; background-color: #ffffff; }</style>"
    }

    private func contentHtml(with latexString: String, fontSize: Int?) -> String {
        let header = configScript() + mathJaxScript() + styleScript(fontSize)
        return "<html><header><meta name=￥\"viewport\" content=\"initial-scale=1.0\">\(header)</header><body>\(latexString)</body></html>"
    }
}

import UIKit
import Flutter

public class MathjaxView: NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64
    let args: Any?
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.args = args
    }
    
    public func view() -> UIView {
        let texView = UIWebView(frame: frame)
        let text = "test $4x=y$"
        texView.loadHTMLString(contentHtmlWithLatexString(latexString), baseURL: nil)
        return texView
    }
    
    // MARK: - Mathjax Logic
    
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

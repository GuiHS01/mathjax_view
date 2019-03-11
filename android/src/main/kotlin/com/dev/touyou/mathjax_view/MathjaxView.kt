package com.dev.touyou.mathjax_view

import android.content.Context
import android.view.View
import android.webkit.WebView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView

class MathjaxView(context: Context, messenger: BinaryMessenger, id: Int, params: Map<String, Any>?): PlatformView, MethodCallHandler {
    private val webView: WebView

    private val methodChannel: MethodChannel

    init {
        webView = WebView(context)

        webView.apply {
            settings.apply {
                javaScriptEnabled = true
                setSupportZoom(true)
                loadWithOverviewMode = true
                useWideViewPort = true
                domStorageEnabled = true
            }
//            webChromeClient = WebChromeClient()
//            webViewClient = WebViewClient()
        }

        webView.loadDataWithBaseURL(null, contentHtml("test $4x=y$ 日本語対応確認", 40), "text/html", "utf-8", null)

        methodChannel = MethodChannel(messenger, "com.dev.touyou/mathjax_view_${id}")
        methodChannel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return webView
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "loadText" -> return
            else -> result.notImplemented()
        }
    }

    override fun dispose() {
    }

    // MARK: Mathjax Logic

    private fun mathJaxScript(): String = "<script async src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML&locale=ja'></script>"

    private fun configScript(): String = "<script type=\"text/x-mathjax-config\">" + "MathJax.Hub.Config({jax: [\"input/TeX\",\"output/HTML-CSS\"], tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]} , \"HTML-CSS\": {linebreaks: {automatic: true}}});" + "</script>"

    private fun styleScript(fontSize: Int?): String {
        val size = fontSize ?: 50
        return "<style>body { font-size: ${size}px; }</style>"
    }

    private fun contentHtml(latexString: String, fontSize: Int?): String {
        val header = configScript() + mathJaxScript() + styleScript(fontSize)
        print(header)
        return "<html><header>${header}</header><body>${latexString}</body></html>"
    }
}

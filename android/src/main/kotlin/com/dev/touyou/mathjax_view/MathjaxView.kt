package com.dev.touyou.mathjax_view

import android.content.Context
import android.view.View
import android.webkit.WebView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView

class MathjaxView(context: Context, messenger: BinaryMessenger, id: Int, params: Map<String, Any>): PlatformView, MethodCallHandler {
    private val webView: WebView

    private val methodChannel: MethodChannel

    init {
        webView = WebView(context)

        webView.loadDataWithBaseURL(null, contentHtml("test $4x=y$"), "text/html", "utf-8", null)

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

    private fun mathJaxScript(): String = "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"

    private fun configScript(): String = "<script type=\"text/x-mathjax-config\">" + "MathJax.Hub.Config({jax: [\"input/TeX\",\"output/HTML-CSS\"], tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]} , \"HTML-CSS\": {linebreaks: {automatic: true}}});" + "</script>"

    private fun contentHtml(latexString: String): String {
        val header = configScript() + mathJaxScript()
        return "<html><header>${header}</header><body>${latexString}</body></html>"
    }
}

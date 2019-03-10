package com.dev.touyou.mathjax_view

import io.flutter.plugin.common.PluginRegistry.Registrar;

class MathjaxViewPlugin {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      registrar.platformViewRegistry().registerViewFactory(
              "com.dev.touyou/mathjax_view", MathjaxViewFactory(registrar.messenger())
      )
    }
  }
}

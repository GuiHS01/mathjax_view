#import "MathjaxViewPlugin.h"
#import <mathjax_view/mathjax_view-Swift.h>

@implementation MathjaxViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMathjaxViewPlugin registerWithRegistrar:registrar];
}
@end

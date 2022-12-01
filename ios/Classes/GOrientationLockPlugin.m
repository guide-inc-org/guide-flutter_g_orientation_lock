#import "GOrientationLockPlugin.h"
#if __has_include(<g_orientation_lock/g_orientation_lock-Swift.h>)
#import <g_orientation_lock/g_orientation_lock-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "g_orientation_lock-Swift.h"
#endif

@implementation GOrientationLockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGOrientationLockPlugin registerWithRegistrar:registrar];
}
@end

# g_orientation_lock

Support issue: https://stackoverflow.com/questions/50756091/ios-disabling-landscape-launchscreen-storyboard

## Getting Started

In AppDelegate.swift:

```dart
import g_orientation_lock

override func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return SwiftGOrientationLockPlugin.orientationLock
    }
```

import Flutter
import UIKit

enum OrientationMode: String {
    case portrait = "portrait"
    case portraitUpsideDown = "portraitUpsideDown"
    case allButUpsideDown = "allButUpsideDown"
}

public class SwiftGOrientationLockPlugin: NSObject, FlutterPlugin {
    public static let METHOD_CHANGE_ORIENTATION = "change_screen_orientation"
    public static let NOTIFICATION_CENTER_NAME = "SwiftGOrientationLockPlugin"
    
    public static var orientationLock = UIInterfaceOrientationMask.portrait
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "g_orientation_lock", binaryMessenger: registrar.messenger())
        let instance = SwiftGOrientationLockPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case SwiftGOrientationLockPlugin.METHOD_CHANGE_ORIENTATION:
            let orientation = call.arguments as! String
            SwiftGOrientationLockPlugin.orientationLock = getUIInterfaceOrientationMask(orientation: orientation);
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: SwiftGOrientationLockPlugin.NOTIFICATION_CENTER_NAME), object: nil)
            result(getOrientationMode(orientation: SwiftGOrientationLockPlugin.orientationLock))
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }
    
    private func getUIInterfaceOrientationMask(orientation: String) -> UIInterfaceOrientationMask {
        switch orientation {
        case OrientationMode.portrait.rawValue:
            return UIInterfaceOrientationMask.portrait
        case OrientationMode.portraitUpsideDown.rawValue:
            return UIInterfaceOrientationMask.portraitUpsideDown
        case OrientationMode.allButUpsideDown.rawValue:
            return UIInterfaceOrientationMask.allButUpsideDown
        default:
            return UIInterfaceOrientationMask.allButUpsideDown
        }
    }
    
    private func getOrientationMode(orientation: UIInterfaceOrientationMask) -> String {
        switch orientation {
        case UIInterfaceOrientationMask.portrait:
            return OrientationMode.portrait.rawValue
        case UIInterfaceOrientationMask.portraitUpsideDown:
            return OrientationMode.portraitUpsideDown.rawValue
        case UIInterfaceOrientationMask.allButUpsideDown:
            return OrientationMode.allButUpsideDown.rawValue
        default:
            return OrientationMode.allButUpsideDown.rawValue
        }
    }
}

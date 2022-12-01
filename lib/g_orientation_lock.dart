
import 'g_orientation_lock_platform_interface.dart';

class GOrientationLock {
  Future<String?> getPlatformVersion() {
    return GOrientationLockPlatform.instance.getPlatformVersion();
  }
}

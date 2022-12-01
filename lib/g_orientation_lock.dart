import 'g_orientation_lock_platform_interface.dart';

class GOrientationLock {
  Future<OrientationMode> changeScreenOrientation({required OrientationMode orientationMode}) {
    return GOrientationLockPlatform.instance.changeScreenOrientation(orientationMode: orientationMode);
  }
}

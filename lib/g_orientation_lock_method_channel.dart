import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'g_orientation_lock_platform_interface.dart';

/// An implementation of [GOrientationLockPlatform] that uses method channels.
class MethodChannelGOrientationLock extends GOrientationLockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('g_orientation_lock');

  @override
  Future<OrientationMode> changeScreenOrientation({required OrientationMode orientationMode}) async {
    final result = await methodChannel.invokeMethod<String>('change_screen_orientation', orientationMode.value);
    return OrientationMode.values.firstWhere((element) => element.value == result, orElse: () => OrientationMode.unknown);
  }
}

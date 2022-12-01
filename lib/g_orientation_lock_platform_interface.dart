import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'g_orientation_lock_method_channel.dart';

enum OrientationMode {
  portrait("portrait"),
  portraitUpsideDown("portraitUpsideDown"),
  allButUpsideDown("allButUpsideDown"),
  unknown("");

  final String value;

  const OrientationMode(this.value);
}

abstract class GOrientationLockPlatform extends PlatformInterface {
  /// Constructs a GOrientationLockPlatform.
  GOrientationLockPlatform() : super(token: _token);

  static final Object _token = Object();

  static GOrientationLockPlatform _instance = MethodChannelGOrientationLock();

  /// The default instance of [GOrientationLockPlatform] to use.
  ///
  /// Defaults to [MethodChannelGOrientationLock].
  static GOrientationLockPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GOrientationLockPlatform] when
  /// they register themselves.
  static set instance(GOrientationLockPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<OrientationMode> changeScreenOrientation({required OrientationMode orientationMode}) {
    throw UnimplementedError('changeScreenOrientation() has not been implemented.');
  }
}

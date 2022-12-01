import 'package:flutter_test/flutter_test.dart';
import 'package:g_orientation_lock/g_orientation_lock.dart';
import 'package:g_orientation_lock/g_orientation_lock_platform_interface.dart';
import 'package:g_orientation_lock/g_orientation_lock_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGOrientationLockPlatform
    with MockPlatformInterfaceMixin
    implements GOrientationLockPlatform {

  @override
  Future<OrientationMode> changeScreenOrientation({required OrientationMode orientationMode}) async => OrientationMode.portrait;
}

void main() {
  final GOrientationLockPlatform initialPlatform = GOrientationLockPlatform.instance;

  test('$MethodChannelGOrientationLock is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGOrientationLock>());
  });

  test('changeScreenOrientation', () async {
    GOrientationLock gOrientationLockPlugin = GOrientationLock();
    MockGOrientationLockPlatform fakePlatform = MockGOrientationLockPlatform();
    GOrientationLockPlatform.instance = fakePlatform;

    expect(await gOrientationLockPlugin.changeScreenOrientation(orientationMode: OrientationMode.portrait), OrientationMode.portrait);
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_orientation_lock/g_orientation_lock_method_channel.dart';
import 'package:g_orientation_lock/g_orientation_lock_platform_interface.dart';

void main() {
  MethodChannelGOrientationLock platform = MethodChannelGOrientationLock();
  const MethodChannel channel = MethodChannel('g_orientation_lock');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.changeScreenOrientation(orientationMode: OrientationMode.portrait), OrientationMode.portrait);
  });
}

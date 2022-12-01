import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:g_orientation_lock/g_orientation_lock.dart';
import 'package:g_orientation_lock/g_orientation_lock_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _orientationModeTitle = 'Unknown';
  final _gOrientationLockPlugin = GOrientationLock();

  @override
  void initState() {
    super.initState();
    initPlatformState(orientationMode: OrientationMode.portrait);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState({required OrientationMode orientationMode}) async {
    String orientationModeTitle;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      orientationModeTitle = (await _gOrientationLockPlugin.changeScreenOrientation(orientationMode: orientationMode)).value;
    } on PlatformException {
      orientationModeTitle = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _orientationModeTitle = orientationModeTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('OrientationMode: $_orientationModeTitle\n'),
              TextButton(
                onPressed: () => initPlatformState(orientationMode: OrientationMode.portrait),
                child: const Text('Portrait'),
              ),
              TextButton(
                onPressed: () => initPlatformState(orientationMode: OrientationMode.portraitUpsideDown),
                child: const Text('PortraitUpsideDown'),
              ),
              TextButton(
                onPressed: () => initPlatformState(orientationMode: OrientationMode.allButUpsideDown),
                child: const Text('AllButUpsideDown'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

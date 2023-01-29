import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Imei {
  static Future<Map> getDeviceInfo() async {
    Map<String, dynamic> deviceInfo = {};
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final builder = await deviceInfoPlugin.androidInfo;
      deviceInfo['serial'] = builder.id;
    } else {
      final data = await deviceInfoPlugin.iosInfo;
      deviceInfo['model'] = data.model;
    }
    return deviceInfo;
  }
}

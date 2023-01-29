/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 20:18:28
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nt/config/config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: DeviceInfoPlugin().androidInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AndroidDeviceInfo info = snapshot.requireData;
            return Text(
              const JsonEncoder.withIndent(' ').convert(
                info.toMap(),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

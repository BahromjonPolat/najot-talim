/*

  Created by: Azizbek
  Created on: Jan 29 2023 12:00:17
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nt/hive/hive_init.dart';
import 'package:nt/services/app_http_overrides.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  await HiveData.init();
  runApp(const MyApp());
}

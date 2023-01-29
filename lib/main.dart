/*

  Created by: Azizbek
  Created on: Jan 29 2023 12:00:17
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nt/hive/hive_init.dart';
import 'package:nt/services/app_http_overrides.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  await Firebase.initializeApp();
  await HiveData.init();
  runApp(const MyApp());
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nt/services/app_http_overrides.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();

  runApp(const MyApp());
}

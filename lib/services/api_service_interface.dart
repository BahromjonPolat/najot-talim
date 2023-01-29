/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 12:00:22
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:http/http.dart' as http;

import 'http_result.dart';

abstract class ApiServiceInterface {
  final String baseUrl = 'https://najot-exam.free.mockoapp.net';
  Future<HttpResult> get(String path, {Map<String, String> headers});

  Future<HttpResult> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
  });

  HttpResult getResult(http.Response response);

  downloadFile({required String url, required String fileName});
}

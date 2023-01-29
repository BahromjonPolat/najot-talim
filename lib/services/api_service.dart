/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:58:04
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nt/services/api_service_interface.dart';

import 'http_result.dart';

class ApiService implements ApiServiceInterface {
  @override
  Future<HttpResult> get(String path, {Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse('$baseUrl$path');
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      return getResult(response);
    } catch (err) {
      return HttpResult(statusCode: 1200, response: err);
    }
  }

  @override
  Future<HttpResult> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    try {
      Uri url = Uri.parse('$baseUrl$path');
      http.Response response = await http.post(
        url,
        body: jsonEncode(body ?? '{}'),
        headers: headers,
      );

      return getResult(response);
    } catch (err) {
      return HttpResult(statusCode: 1200, response: err);
    }
  }

  @override
  HttpResult getResult(http.Response response) {
    dynamic decodedData = jsonDecode(response.body);
    HttpResult result = HttpResult(
      isSuccess: decodedData['error'].toString().toLowerCase() == 'ok',
      statusCode: response.statusCode,
      response: decodedData,
    );

    return result;
  }

  @override
  String get baseUrl => 'https://pos.in1.uz/api';
}

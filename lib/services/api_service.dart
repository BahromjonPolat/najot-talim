/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:58:04
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:nt/services/api_service_interface.dart';
import 'package:path_provider/path_provider.dart';

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

  @override
  downloadFile({required String fileName, required String url}) async {
    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(url));
    var response = httpClient.send(request);
    String dir = (await getApplicationDocumentsDirectory()).path;

    List<List<int>> chunks = [];
    int downloaded = 0;

    response.asStream().listen((http.StreamedResponse r) {
      r.stream.listen((List<int> chunk) {
        // Display percentage of completion
        debugPrint(
            'downloadPercentage: ${downloaded / r.contentLength! * 100}');

        chunks.add(chunk);
        downloaded += chunk.length;
      }, onDone: () async {
        // Display percentage of completion
        debugPrint(
            'downloadPercentage: ${downloaded / r.contentLength! * 100}');

        // Save the file
        File file = File('$dir/$fileName');
        final Uint8List bytes = Uint8List(r.contentLength!);
        int offset = 0;
        for (List<int> chunk in chunks) {
          bytes.setRange(offset, offset + chunk.length, chunk);
          offset += chunk.length;
        }
        await file.writeAsBytes(bytes);
      });
    });
  }

  Stream<http.StreamedResponse> downloadFiles({
    required String fileName,
    required String url,
  }) async* {
    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(url));
    var response = httpClient.send(request);

    response.asStream();
  }
}

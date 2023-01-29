/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:57:17
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';
import 'dart:io';

import 'package:nt/config/constants/constants.dart';

class HttpResult {
  final int statusCode;
  final dynamic response;
  bool isSuccess;

  HttpResult({
    this.isSuccess = false,
    required this.statusCode,
    required this.response,
  });

  dynamic getData() {
    if (isSuccess) {
      if (response['data'].runtimeType is String) {
        return response;
      }

      return response['data'];
    }

    if (response is SocketException) {
      return AppStrings.noInternet;
    } else if (response is TimeoutException) {
      return AppStrings.timeOutException;
    } else if (response is HttpException) {
      return AppStrings.httpError;
    } else if (response is FormatException) {
      return AppStrings.formatException;
    } else {
      return response['error'].toString();
    }
  }
}

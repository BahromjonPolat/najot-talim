/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 17:28:42
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  late StreamSubscription subscription;
  DownloadBloc() : super(DownloadInitial()) {
    on<DownloadFromUrl>(_downloadFile);
  }

  FutureOr<void> _downloadFile(
    DownloadFromUrl event,
    Emitter emit,
  ) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String fileName = event.url.split('/').last;
    File file = File('${dir.path}/$fileName');
  }
}

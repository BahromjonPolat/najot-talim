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

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nt/models/file/file_info.dart';
import 'package:nt/services/api_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final ApiService _service = ApiService();
  late StreamSubscription subscription;

  DownloadBloc() : super(DownloadInitial()) {
    on<DownloadFromUrl>(_downloadFile);
    on<PauseDownloadingFile>(_pause);
    on<ResumeDownloadinfFile>(_resume);
    on<CheckFileEvent>(_checkFile);
    on<DownloadingEvent>(_loading);
  }

  FutureOr<void> _checkFile(
    CheckFileEvent event,
    Emitter emit,
  ) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String fileName = event.url.split('/').last;
    File file = File('${dir.path}/$fileName');
    if (await file.exists()) {
      emit(CompletedDownloadinfState(file));
    }
  }

  FutureOr<void> _downloadFile(
    DownloadFromUrl event,
    Emitter emit,
  ) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String fileName = event.fileInfo.url.split('/').last;
    File file = File('${dir.path}/$fileName');
    List<List<int>> chunks = [];
    int downloaded = 0;

    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(event.fileInfo.url));
    var response = httpClient.send(request);

    response.asStream().listen((http.StreamedResponse r) {
      r.stream.listen((List<int> chunk) {
        // Display percentage of completion
        double percent = downloaded / r.contentLength! * 100;

        chunks.add(chunk);
        downloaded += chunk.length;
        add(DownloadingEvent(percent));
      }, onDone: () async {
        // Display percentage of completion

        // Save the file
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

  FutureOr<void> _loading(
    DownloadingEvent event,
    Emitter emit,
  ) {
    emit(LoadingDownloadFileState(event.percent.toDouble()));
  }

  FutureOr<void> _pause(
    PauseDownloadingFile event,
    Emitter emit,
  ) {
    subscription.pause();
    emit(PausedDownloadFileState());
  }

  FutureOr<void> _resume(
    ResumeDownloadinfFile event,
    Emitter emit,
  ) {
    subscription.resume();
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}

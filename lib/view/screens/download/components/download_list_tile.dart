/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 16:45:22
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt/config/constants/constants.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DownloadListTile extends StatefulWidget {
  const DownloadListTile({super.key});

  @override
  State<DownloadListTile> createState() => _DownloadListTileState();
}

class _DownloadListTileState extends State<DownloadListTile> {
  late StreamSubscription subscription;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Hello'),
      onTap: () {
        subscription.pause();
      },
      trailing: IconButton(
        color: AppColors.black,
        icon: const Icon(Icons.download),
        onPressed: () {
          print('dafasdf');
          downloadFile(
            url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
            fileName: 'hello.pdf',
          );
        },
      ),
    );
  }

  downloadFile({required String fileName, required String url}) async {
    print('dsfadsfadsf');
    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(url));
    var response = httpClient.send(request);
    String dir = (await getApplicationDocumentsDirectory()).path;

    List<List<int>> chunks = [];
    int downloaded = 0;
    print('============');

    response.asStream().listen((http.StreamedResponse r) {
      subscription = r.stream.listen((List<int> chunk) {
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
}

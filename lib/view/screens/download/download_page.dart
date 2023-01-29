/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 12:35:33
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
import 'package:nt/services/api_service.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  late StreamSubscription streamSubscription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: const Text('Python'),
          onLongPress: () {
            ApiService service = ApiService();
            service.downloadFile(
              fileName: 'dfas/pdf',
              url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
            );
          },
          onTap: () async {
            String dir = (await getApplicationDocumentsDirectory()).path;
            List<List<int>> chunks = [];
            int downloaded = 0;

            ApiService service = ApiService();
            streamSubscription = service
                .downloadFiles(
              fileName: 'Pyht.pdf',
              url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
            )
                .listen(
              (r) {
                r.stream.listen((List<int> chunk) {
                  debugPrint(
                      'downloadPercentage: ${downloaded / r.contentLength! * 100}');

                  chunks.add(chunk);
                  downloaded += chunk.length;
                }).onDone(() {
                  () async {
                    // Display percentage of completion
                    debugPrint(
                        'downloadPercentage: ${downloaded / r.contentLength! * 100}');

                    // Save the file
                    File file = File('$dir/dfad.pdf');
                    final Uint8List bytes = Uint8List(r.contentLength!);
                    int offset = 0;
                    for (List<int> chunk in chunks) {
                      bytes.setRange(offset, offset + chunk.length, chunk);
                      offset += chunk.length;
                    }
                    await file.writeAsBytes(bytes);
                  };
                });
              },
            );
          },
        ),
        ListTile(
          title: Text('pause'),
          onTap: () {
            streamSubscription.pause();
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}

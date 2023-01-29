/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 14:40:40
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'dart:math' as math;

class DownloadListTile extends StatefulWidget {
  final String url;

  const DownloadListTile({Key? key, required this.url}) : super(key: key);

  @override
  State<DownloadListTile> createState() => _CourseListItemPage();
}

class _CourseListItemPage extends State<DownloadListTile> {
  int downloadProgress = 0;

  bool isDownloadStarted = false;

  bool isDownloadFinish = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.url),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        child: Text(
          widget.url.substring(0, 1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      trailing: Column(
        children: [
          // Visibility(
          //   visible: isDownloadStarted,
          //   child: CircularPercentIndicator(
          //     radius: 20.0,
          //     lineWidth: 3.0,
          //     percent: (downloadProgress / 100),
          //     center: Text(
          //       "$downloadProgress%",
          //       style: const TextStyle(fontSize: 12, color: Colors.blue),
          //     ),
          //     progressColor: Colors.blue,
          //   ),
          // ),
          Visibility(
            visible: !isDownloadStarted,
            child: IconButton(
              icon: const Icon(Icons.download),
              color: isDownloadFinish ? Colors.green : Colors.grey,
              onPressed: downloadCourse,
            ),
          )
        ],
      ),
    );
  }

  void downloadCourse() async {
    isDownloadStarted = true;
    isDownloadFinish = false;
    downloadProgress = 0;
    setState(() {});

    //Download logic
    while (downloadProgress < 100) {
      // Get download progress
      downloadProgress += 10;
      setState(() {});
      if (downloadProgress == 100) {
        isDownloadFinish = true;
        isDownloadStarted = false;
        setState(() {});
        break;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}

/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 16:44:13
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:nt/config/mock/mock_downloading_files.dart';
import 'package:nt/models/file/file_info.dart';
import 'package:nt/view/screens/download/components/download_list_tile.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            MockFileInfoData.fileInfoList
                .map((info) => DownloadListTile(fileInfo: info))
                .toList(),
          ),
        )
      ],
    );
  }
}

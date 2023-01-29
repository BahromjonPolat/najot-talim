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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt/blocs/download/download_bloc.dart';
import 'package:nt/config/constants/constants.dart';
import 'package:nt/models/file/file_info.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DownloadListTile extends StatelessWidget {
  final FileInfo fileInfo;
  const DownloadListTile({super.key, required this.fileInfo});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadBloc()..add(CheckFileEvent(fileInfo.url)),
      child: BlocConsumer<DownloadBloc, DownloadState>(
        listener: (context, state) {},
        builder: (context, state) {
          DownloadBloc downloadBloc = BlocProvider.of(context);
          bool complated = state is CompletedDownloadinfState;
          return ListTile(
            title: Text(fileInfo.fileName),
            trailing: complated
                ? const Icon(AppIcons.downloaded)
                : IconButton(
                    color: AppColors.black,
                    icon: Icon(
                      state is LoadingDownloadFileState
                          ? Icons.pause
                          : AppIcons.download,
                    ),
                    onPressed: () {
                      if (state is LoadingDownloadFileState) {
                        downloadBloc.add(DownloadFromUrl(fileInfo: fileInfo));
                      } else {
                        downloadBloc.add(PauseDownloadingFile());
                      }
                    },
                  ),
          );
        },
      ),
    );
  }
}

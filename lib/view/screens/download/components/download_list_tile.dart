/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 16:45:22
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nt/blocs/download/download_bloc.dart';
import 'package:nt/config/constants/constants.dart';
import 'package:nt/models/file/file_info.dart';
import 'package:open_file/open_file.dart';

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
            trailing: const Icon(Icons.file_copy),
            leading: complated
                ? const Icon(AppIcons.downloaded)
                : IconButton(
                    color: AppColors.black,
                    icon: Icon(
                      state is LoadingDownloadFileState
                          ? Icons.pause
                          : AppIcons.download,
                    ),
                    onPressed: () {
                      if (state is PausedDownloadFileState) {
                        downloadBloc.add(ResumeDownloadinfFile());
                      } else if (state is LoadingDownloadFileState) {
                        downloadBloc.add(PauseDownloadingFile());
                      } else {
                        downloadBloc.add(DownloadFromUrl(fileInfo: fileInfo));
                      }
                    },
                  ),
            subtitle: LinearProgressIndicator(
              value: _getPercent(state),
              color: state is CompletedDownloadinfState
                  ? AppColors.primary
                  : AppColors.blue,
            ),
            onTap: () async {
              if (state is CompletedDownloadinfState) {
                await OpenFile.open(state.file.path);
              } else if (state is LoadingDownloadFileState) {
                Fluttertoast.showToast(msg: "Yuklanyapti");
              } else {
                downloadBloc.add(DownloadFromUrl(fileInfo: fileInfo));
              }
            },
          );
        },
      ),
    );
  }

  double _getPercent(DownloadState state) {
    if (state is LoadingDownloadFileState) {
      return state.percent / 100;
    } else if (state is CompletedDownloadinfState) {
      return 1.0;
    } else if (state is PausedDownloadFileState) {
      return state.percent / 100;
    }

    return 0.0;
  }
}

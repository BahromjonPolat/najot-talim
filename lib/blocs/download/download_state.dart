part of 'download_bloc.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class LoadingDownloadFileState extends DownloadState {
  final double percent;
  LoadingDownloadFileState(this.percent);
}

class PausedDownloadFileState extends DownloadState {}

class CompletedDownloadinfState extends DownloadState {
  final File file;
  CompletedDownloadinfState(this.file);
}

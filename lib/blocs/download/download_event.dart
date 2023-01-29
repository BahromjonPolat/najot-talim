part of 'download_bloc.dart';

abstract class DownloadEvent {}

class DownloadFromUrl extends DownloadEvent {
  FileInfo fileInfo;
  DownloadFromUrl({required this.fileInfo});
}

class PauseDownloadingFile extends DownloadEvent {}

class ResumeDownloadinfFile extends DownloadEvent {}

class CheckFileEvent extends DownloadEvent {
  final String url;
  CheckFileEvent(this.url);
}

class DownloadingEvent extends DownloadEvent {
  final num percent;
  DownloadingEvent(this.percent);
}

class OnCompleteEvent extends DownloadEvent {
  final File file;
  OnCompleteEvent(this.file);
}

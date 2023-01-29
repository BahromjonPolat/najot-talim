part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {}

class DownloadFromUrl extends DownloadEvent {
  final String url;
  DownloadFromUrl({required this.url});
}

class PauseDownloadingFile extends DownloadEvent {}

class ResumeDownloadinfFile extends DownloadEvent {}

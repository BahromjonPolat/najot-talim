part of 'download_bloc.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class LoadingDownloadFileState extends DownloadState {}

class PausedDownloadFileState extends DownloadState {}

class CompletedDownloadinfState extends DownloadState {}

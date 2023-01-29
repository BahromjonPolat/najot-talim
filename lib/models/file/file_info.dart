// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 17:26:44
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

class FileInfo {
  final String fileName;
  final String url;
  FileInfo({
    required this.fileName,
    required this.url,
  });

  FileInfo copyWith({
    String? fileName,
    String? url,
  }) {
    return FileInfo(
      fileName: fileName ?? this.fileName,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileName': fileName,
      'url': url,
    };
  }

  factory FileInfo.fromMap(Map<String, dynamic> map) {
    return FileInfo(
      fileName: map['fileName'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileInfo.fromJson(String source) =>
      FileInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FileInfo(fileName: $fileName, url: $url)';

  @override
  bool operator ==(covariant FileInfo other) {
    if (identical(this, other)) return true;

    return other.fileName == fileName && other.url == url;
  }

  @override
  int get hashCode => fileName.hashCode ^ url.hashCode;
}

/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 18:04:42
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:nt/models/file/file_info.dart';

class MockFileInfoData {
  const MockFileInfoData._();
  static List<FileInfo> get fileInfoList => [
        FileInfo(
          fileName: '"PythonBook"',
          url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
        ),
        FileInfo(
          fileName: 'Image',
          url:
              'https://images.unsplash.com/photo-1674976645516-7b20134fdeb3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
        ),
        FileInfo(
          fileName: '"Duck",',
          url:
              'https://images.unsplash.com/photo-1674903273402-d7ca38d6afc5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        ),
        FileInfo(
          fileName: 'Video',
          url:
              'https://file-examples.com/storage/fe0358100863d05afed02d2/2017/04/file_example_MP4_1920_18MG.mp4',
        ),
      ];
}

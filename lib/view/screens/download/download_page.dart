/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 12:35:33
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:nt/services/api_service.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: const Text('Python'),
          onTap: () {
            ApiService service = ApiService();
            service.downloadFile(
              fileName: 'Pyht.pdf',
              url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
            );
          },
        ),
      ],
    );
  }
}

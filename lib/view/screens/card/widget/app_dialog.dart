/*

  Created by: Azizbek
  Created on: Jan 29 2023 23:35:40
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_navigator.dart';

class AppDialog {
  BuildContext context;
  AppDialog(this.context);

  showCupertinoModalSheet({List<Widget>? actions}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => CupertinoActionSheet(
        actions: actions,
        cancelButton: ElevatedButton(
          onPressed: () {
            AppNavigator.pop;
          },
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> showSimpleDialog({
    String title = '',
    String contentText = '',
    VoidCallback? onYesPressed,
        VoidCallback? onCancelPressed,

    
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(contentText),
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            actions: [
              TextButton(
                onPressed: onYesPressed,
                child: const Text('ok'),
              ),
              TextButton(
                onPressed: onCancelPressed,
                child: const Text('cancel'),
              ),
            ],
          );
        });
  }
}

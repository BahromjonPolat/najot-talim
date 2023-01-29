/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 19:22
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
                onPressed: () {},
                child: Text('ok'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('cann'),
              ),
            ],
          );
        });
  }
}

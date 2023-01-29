/*

  Created by: Azizbek
  Created on: Jan 29 2023 23:35:46
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/


import 'package:flutter/cupertino.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/theme/app_text_style.dart';

// ignore: must_be_immutable
class AppCupertinoAction extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  bool isDefault;
  AppCupertinoAction({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isDefault = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      isDefaultAction: isDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyle.regular(size: 20)),
          Visibility(
            visible: isDefault,
            child: const Icon(
              CupertinoIcons.check_mark,
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}

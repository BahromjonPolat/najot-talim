/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 23:10:41
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/config/theme/theme.dart';

// ignore: must_be_immutable
class InputWithTitle extends StatelessWidget {
  final String title;
  TextEditingController? controller;
  String? hint;
  Widget? suffixIcon;
  List<TextInputFormatter>? formatters;
  TextInputType? keyboardType;
  bool readOnly;
  TextInputAction action;
  TextCapitalization capitalization;
  VoidCallback? onTap;
  int maxLines;
  Color? fillColor;
  FormFieldValidator<String>? validator;

  InputWithTitle({
    Key? key,
    required this.title,
    this.controller,
    this.hint,
    this.suffixIcon,
    this.formatters,
    this.keyboardType,
    this.readOnly = false,
    this.action = TextInputAction.next,
    this.capitalization = TextCapitalization.words,
    this.onTap,
    this.maxLines = 1,
    this.validator,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          validator: validator,
          textInputAction: action,
          textCapitalization: capitalization,
          style: AppTextStyle.medium(size: 16),
          inputFormatters: formatters,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
            hintText: hint,
            fillColor: fillColor,
            suffixIcon: suffixIcon,
          ),
        ),
        SizedBox(height: 12.h)
      ],
    );
  }
}

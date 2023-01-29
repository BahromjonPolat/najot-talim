/*

  Created by: Azizbek
  Created on: Jan 29 2023 23:35:53
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/app_text_style.dart';

class CardWidget {
  static cardWidget(Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        color: color,
        elevation: 1,
        margin: const EdgeInsets.all(0.0),
        child: Column(
          children: const [
            Text('shaxsiy'),
            Text('1111 2222 3333 4444'),
            Text('11/23'),
            Text('Qodirov Azizbek'),
          ],
        ),
      ),
    );
  }

  static textInputter(
    TextStyle style,
    TextEditingController controller,
    String hintText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              hintText,
              style: style.copyWith(fontSize: 16),
            ),
          ),
          TextFormField(
            maxLines: 1,
            controller: controller,
            style: style,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: style.copyWith(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

 static cardInfo(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text, style: AppTextStyle.title(color: Colors.white)),
    );
  }
  
}


// Created by Bahromjon Po'lat
// Created at 26.08.2022 11:19


// ignore: must_be_immutable
class AppInputField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Widget? prefixIcon;
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

  AppInputField({
    Key? key,
    this.controller,
    this.hint,
    this.prefixIcon,
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
    return TextFormField(
      controller: controller,
      // enabled: enabled,
      
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
        hintText: hint,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

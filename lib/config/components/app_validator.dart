/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:36:31
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppValidators {
  static String? phone(value) {
    String phone = '+998$value'.replaceAll(' ', '');
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(phone, _phonePattern)) {
      return "Enter valid phone number!";
    }
    return null;
  }

  static String? general(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    }
    return null;
  }

  static final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  static bool _validPattern(String value, String pattern) {
    return RegExp(pattern).hasMatch(value);
  }

  static String? codeCard(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 19) {
      return "Please enter card code";
    }
    return null;
  }

  static String? mmYY(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 5) {
      return "Enter Card MM/YY";
    }
    return null;
  }

  static String? cvc(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 3) {
      return "Please, Enter valid CVC";
    }
    return null;
  }

  // Credit card formatters
  static final cardFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final cardDateFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  static const String _phonePattern = r'^\+998(33|88|9[01345789])[0-9]{7}$';
}

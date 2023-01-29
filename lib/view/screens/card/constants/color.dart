/*

  Created by: Azizbek
  Created on: Jan 29 2023 23:36:08
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

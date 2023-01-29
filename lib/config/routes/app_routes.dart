/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 11:24:47
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:nt/view/screens/card/card_screen.dart';

import 'routes.dart';

class AppRoutes {
  const AppRoutes._();
  static Route? onGenerateRoute(RouteSettings settings) {
    Object? args = settings.arguments;
    String? name = settings.name;
    switch (name) {
      case RouteNames.card:
        return _route(const CardScreen());

      // case RouteNames.home:
      //   return _route(const HomeScreen());

      // case RouteNames.verifyOtp:
      //   return _route(const VerifyOtpScreen());

      // case RouteNames.selectingBranch:
      //   return _route(const SelectingBranchScreen());

      // case RouteNames.selectingDevice:
      //   return _route(const SelectingPosDeviceScreen());

      // case RouteNames.pincode:
      //   return _route(const PincodeScreen());

      // case RouteNames.barcodeScan:
      //   return _route(const BarcodeScanPage());

      // case RouteNames.general:
      //   return _route(const GeneralScreen());

      // case RouteNames.editingProfile:
      //   return _route(const EditingProfileScreen());

      default:
        return null;
    }
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}

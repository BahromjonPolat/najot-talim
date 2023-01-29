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
import 'package:nt/view/screens/card/add_cart.dart';
import 'package:nt/view/screens/card/edit_cart.dart';
import 'package:nt/view/screens/card/select_card.dart';
import 'package:nt/view/screens/screens.dart';
import 'package:nt/view/screens/splash/splash_screen.dart';

import 'routes.dart';

class AppRoutes {
  const AppRoutes._();
  static Route? onGenerateRoute(RouteSettings settings) {
    Object? args = settings.arguments;
    String? name = settings.name;
    switch (name) {
      case RouteNames.card:
        return _route(const SelectCard());

      case RouteNames.addCard:
        return _route(const AddCard());

      case RouteNames.initial:
        return _route(const SplashScreen());

      case RouteNames.home:
        return _route(const HomeScreen());

      default:
        return null;
    }
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}

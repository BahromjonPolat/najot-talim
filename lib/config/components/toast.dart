import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fireToast(String name) {
    Fluttertoast.showToast(
        msg: name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textColor: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 16.0);
  }
}

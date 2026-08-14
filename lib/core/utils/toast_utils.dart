import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast({
    required String msg,
    required ToastGravity gravity,
    required Color backColor,
    required Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/common/navigator_helper.dart';

class CommonFunctions {
  static void restartApp() async {
    Navigator.popUntil(NavigationService.navigatorKey.currentContext!,
        ModalRoute.withName("/"));
    await Future.delayed(const Duration(milliseconds: 200));
    Navigator.pushNamed(NavigationService.navigatorKey.currentContext!, "/");
  }

  static Future<bool>? onWillPop(DateTime currentBackPressTime) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press back again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';

class APICalls {
  static Future<http.Response> getResponse(
      {required String url,
      bool isPost = false,
      Map<String, Object> body = const {},
      http.BaseRequest? request}) async {
    http.Response? response;
    try {
      if (isPost) {
        response = await http.post(Uri.parse(url), body: body);
      } else {
        response = await http.get(Uri.parse(url));
      }
      if (response.statusCode == 200) {
        if (response.body == "") {
          Fluttertoast.showToast(msg: "Something went wrong CODE: -1");
        }
        response = response;
      } else if (response.statusCode == 404) {
        PreferenceUtils.setBool(Constants.isLogin, false).then((value) {
          Fluttertoast.showToast(msg: "Your id has been locked by admin");
        });
      } else {
        Fluttertoast.showToast(
            msg: "Internal Server Error ${response.statusCode}");
      }
    } catch (e) {
      if (e is SocketException) {
        Fluttertoast.showToast(msg: "No Internet Connection");
      }
      debugPrint(e.toString());
    }
    return Future.value(response);
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APICalls {
  static Future<http.Response> getResponse(
      {required String url, bool isPost = false, String body = '',http.BaseRequest? request}) async {
    http.Response? response;
    try {
      if (isPost) {
        response = await http.post(Uri.parse(url), body: body);
      } else {
        response = await http.get(Uri.parse(url));
      }
      if (response.statusCode == 200) {
        response = response;
      } else if (response.statusCode == 404) {
      } else if (response.statusCode == 500) {
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
    return Future.value(response);
  }
}

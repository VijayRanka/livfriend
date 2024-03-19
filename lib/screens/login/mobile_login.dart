import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/common_circular_screen.dart';
import 'package:livefriend/common/common_functions.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/common_submit_button.dart';
import 'package:livefriend/screens/common_widgets/terms_condition_text.dart';
import 'package:livefriend/screens/otp_verify_screen/otp_verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _loginController;
  bool isLoading = false;

  @override
  void initState() {
    initViews();
    super.initState();
  }

  void initViews() {
    _loginController = TextEditingController();
  }

  Future<void> loginWithMobileNumber(String mobileNumber, int otp) async {
    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {
          "login_api": "login_api",
          "otp": "$otp",
          "mobile_number": "$mobileNumber"
        }).then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status']) {
          FocusScope.of(context).unfocus();

          Fluttertoast.showToast(msg: jsonResponse['message']);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => OtpVerifyScreen(
                    mobileNumber: mobileNumber,
                    otp: otp,
                  )));
        } else {
          Fluttertoast.showToast(msg: jsonResponse['message']);
        }
      }
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonAppBar(text: "Login", isBackButton: false),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25.0, bottom: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.3,
                              ),
                              offset: Offset(5, 5),
                              blurRadius: 10,
                            )
                          ],
                          image: DecorationImage(
                              image: AssetImage(Constants.lightLogo))),
                      height: 150,
                      width: 150,
                    ),
                    _loginController == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              controller: _loginController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                label: Text("Enter your 10 digit mobile number",
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 16)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1.0),
                                ),
                              ),
                              style: TextStyle(
                                  color: Constants.darkMode
                                      ? Colors.white
                                      : Color(0XFF444444),
                                  fontSize: 16),
                            ),
                          ),
                    CustomSubmitButton(
                        text: 'LOGIN',
                        onTap: () async {
                          if (_loginController != null) {
                            if (_loginController!.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter 10 digit number");
                            } else if ((_loginController!.text.trim().length <
                                    10) ||
                                _loginController!.text.trim().length > 10) {
                              Fluttertoast.showToast(
                                  msg: "Please enter 10 digit number");
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              await loginWithMobileNumber(
                                  _loginController!.text,
                                  CommonFunctions.getRandomOTP());
                            }
                          }
                        },
                        horizontalPadding: 15),
                  ]),
            ),
            TermsConditionText(),
          ],
        ),
        CommonCircularLoadingScreen(
          isLoading: isLoading,
        )
      ],
    ));
  }
}

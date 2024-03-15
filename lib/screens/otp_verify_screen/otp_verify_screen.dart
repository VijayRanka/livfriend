import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/common_circular_screen.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/common_submit_button.dart';
import 'package:livefriend/screens/common_widgets/terms_condition_text.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobileNumber;
  final int otp;

  const OtpVerifyScreen({this.mobileNumber = "-", this.otp = 123456, Key? key})
      : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  OtpFieldController _otpFieldController = OtpFieldController();
  int timerCount = 45;
  bool canResend = false, isLoading = false;
  Timer? _myTimer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Future.delayed(Duration.zero, () {
      _myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCount <= 0) {
          timer.cancel();
          _myTimer?.cancel();
          setState(() {
            canResend = true;
          });
        } else {
          setState(() {
            timerCount--;
          });
        }
      });
      _otpFieldController.setFocus(0);
    });
  }

  @override
  void dispose() {
    _myTimer?.cancel();
    super.dispose();
  }

  Future<void> registerUser() async {
    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {
          "register_api": "register_api",
          "mobile_number": "${widget.mobileNumber}"
        }).then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status']) {
          Fluttertoast.showToast(msg: jsonResponse['message']);

          PreferenceUtils.setBool(Constants.isLogin, true).then((value) {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(Constants.dashboardPath);
          });
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonAppBar(
                text: "",
                onTap: Navigator.of(context).pop,
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Lottie.asset(
                        "assets/images/otp_confirm.json",
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Enter the OTP sent to "),
                        Text(
                          "+91 ${widget.mobileNumber}",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20),
                      child: OTPTextField(
                        length: 5,
                        onChanged: (_) {},
                        controller: _otpFieldController,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: MediaQuery.of(context).size.width / 6,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) async {
                          if (pin == widget.otp.toString()) {
                            setState(() {
                              isLoading = true;
                            });
                            await registerUser();
                          }else{
                            Fluttertoast.showToast(msg: "Wrong OTP");
                          }
                        },
                      ),
                    ),
                    Text("Didn't receive the OTP ?"),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (canResend) {
                          Fluttertoast.showToast(msg: "Resend OTP");
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("RESEND OTP",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700)),
                          canResend
                              ? const SizedBox.shrink()
                              : Text(
                                  " in $timerCount sec",
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomSubmitButton(
                      text: "VERIFY & PROCEED",
                      horizontalPadding: 15,
                    )
                  ],
                ),
              ),
              TermsConditionText(),
            ],
          ),
          CommonCircularLoadingScreen(
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}

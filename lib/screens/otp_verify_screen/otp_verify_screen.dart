import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/common_circular_screen.dart';
import 'package:livefriend/common/common_functions.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/user_model.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/common_submit_button.dart';
import 'package:livefriend/screens/common_widgets/terms_condition_text.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobileNumber;
  int otp;

  OtpVerifyScreen({this.mobileNumber = "-", this.otp = 12345, Key? key})
      : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  OtpFieldController _otpFieldController = OtpFieldController();
  int timerCount = 5;
  bool canResend = false, isLoading = false;
  Timer? _myTimer;
  String otpValue = "";

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Future.delayed(Duration.zero, () {
      _myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCount <= 1) {
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
          "mobile_number": "${widget.mobileNumber}",
        }).then((response) {
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(json.decode(response.body));
        String message = userModel.message ?? "";
        if (message != "") {
          Fluttertoast.showToast(msg: (message));
        }
        if (userModel.status ?? false) {
          PreferenceUtils.setBool(Constants.isLogin, true).then((value) {
            PreferenceUtils.setString(
                    Constants.userID, (userModel.userDetails?.id) ?? "")
                .then((value) {
              PreferenceUtils.setString(Constants.userMobile,
                      (userModel.userDetails?.mobileNumber) ?? "")
                  .then((value) {
                PreferenceUtils.setString(Constants.userGender,
                        (userModel.userDetails?.gender) ?? "")
                    .then((value) {
                  PreferenceUtils.setString(
                          Constants.userDOB, (userModel.userDetails?.dob) ?? "")
                      .then((value) {
                    PreferenceUtils.setString(Constants.userDND,
                            (userModel.userDetails?.dnd) ?? "")
                        .then((value) {
                      PreferenceUtils.setString(Constants.userMainImage,
                              (userModel.userDetails?.mainImage) ?? "")
                          .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(Constants.dashboardPath);
                      });
                    });
                  });
                });
              });
            });
          });
        } else {
          if (message != "") {
            Fluttertoast.showToast(msg: message);
          }
        }
      }
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> resentOtp() async {
    setState(() {
      timerCount = 45;
      isLoading = true;
    });
    widget.otp = CommonFunctions.getRandomOTP();

    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {
          "login_api": "login_api",
          "otp": "${widget.otp}",
          "mobile_number": widget.mobileNumber
        }).then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status']) {
          FocusScope.of(context).unfocus();
          Fluttertoast.showToast(msg: jsonResponse['message']);
          setState(() {
            isLoading = false;
            canResend = false;
            timerCount = 45;
          });
          startTimer();
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
    print(widget.otp);
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
                        onChanged: (value) {
                          setState(() {
                            otpValue = value;
                          });
                        },
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
                          } else {
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
                          resentOtp();
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
                      onTap: () async {
                        if (otpValue.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please fill otp and then proceed");
                          return;
                        } else if (otpValue != widget.otp.toString()) {
                          Fluttertoast.showToast(msg: "Wrong OTP");
                          return;
                        } else if (otpValue == widget.otp.toString()) {
                          setState(() {
                            isLoading = true;
                          });
                          await registerUser();
                        }
                      },
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

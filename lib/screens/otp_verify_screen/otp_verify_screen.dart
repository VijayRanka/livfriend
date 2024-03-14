import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_submit_button.dart';
import 'package:livefriend/screens/common_widgets/terms_condition_text.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobileNumber;
  final double otp;

  const OtpVerifyScreen({this.mobileNumber = "-", this.otp = 123456, Key? key})
      : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  OtpFieldController _otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 25,
            width: double.infinity,
            color: Colors.green,
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text(
                    "OTP Verification",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                      horizontal: 15.0, vertical: 15),
                  child: OTPTextField(
                    length: 5,
                    onChanged: (_) {},
                    controller: _otpFieldController,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: MediaQuery.of(context).size.width / 6,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ),
                Text("Didn't receive the OTP ?"),
                const SizedBox(
                  height: 10,
                ),
                Text("RESEND OTP",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w700)),
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
    );
  }
}

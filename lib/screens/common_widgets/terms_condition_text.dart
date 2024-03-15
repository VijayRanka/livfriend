import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:livefriend/common/constants.dart';

class TermsConditionText extends StatelessWidget {
  const TermsConditionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(color: Constants.darkMode?Colors.white:Colors.grey[700], fontSize: 15),
            children: [
              TextSpan(text: "By signing up, you agree to our "),
              TextSpan(
                  text: "Terms",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(text: ". See how we use your data in our "),
              TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ]),
      ),
    );
  }
}

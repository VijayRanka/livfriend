import 'package:flutter/material.dart';
import 'package:livefriend/common/constants.dart';
import 'package:lottie/lottie.dart';

class HiLottieAnimation extends StatelessWidget {
  const HiLottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      child: Center(
        child: Lottie.asset(Constants.hiLottie),
      ),
    );
  }
}

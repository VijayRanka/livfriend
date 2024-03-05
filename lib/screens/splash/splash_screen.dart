import 'dart:async';

import 'package:flutter/material.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/screens/common_widgets/custom_circular_widget.dart';
import 'package:livefriend/screens/dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer(time: 3);
    super.initState();
  }

  void startTimer({int time = 0}) {
    Future.delayed(Duration(seconds: time), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0XFFff66c4), Color(0XFFfc7ecc)])),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(10, 10),
                    blurRadius: 10)
              ]),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(Constants.lightLogo),
            ),
          ),
          const Align(
              alignment: Alignment.bottomCenter, child: CustomCircularWidget()),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class InitialLoginScreen extends StatelessWidget {
  const InitialLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Text("Initial Login"),
      ),
    ));
  }
}

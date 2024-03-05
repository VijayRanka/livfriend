import 'package:flutter/material.dart';

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(child: Text("Incoming Call"),),));
  }
}

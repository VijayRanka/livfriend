import 'package:flutter/material.dart';

class BlockListScreen extends StatelessWidget {
  const BlockListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Text("Bloc List Details"),
      ),
    ));
  }
}

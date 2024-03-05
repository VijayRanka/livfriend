import 'package:flutter/material.dart';

class CustomCircularWidget extends StatelessWidget {
  const CustomCircularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }
}

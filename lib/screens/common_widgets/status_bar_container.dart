import 'package:flutter/material.dart';

class StatusBarContainer extends StatelessWidget {
  final Color color;

  const StatusBarContainer({this.color = Colors.green, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: color,
    );
  }
}

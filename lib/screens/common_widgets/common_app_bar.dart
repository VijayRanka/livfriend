import 'package:flutter/material.dart';
class CommonAppBar extends StatelessWidget {
  final Color color;
  final String text;
  final bool isBackButton;
  final Function()? onTap;

  const CommonAppBar(
      {this.color = Colors.green,
      this.text = "-",
      this.onTap,
      this.isBackButton = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.green,title: Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,letterSpacing: 1.1),
    ),);
  }
}

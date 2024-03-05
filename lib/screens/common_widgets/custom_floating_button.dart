import 'package:flutter/material.dart';

class CustomFloatingWidget extends StatelessWidget {
  const CustomFloatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return FloatingActionButton(
      onPressed: () {},
      tooltip: "Contact Us",
      backgroundColor: isDarkTheme ? Colors.grey[800] : Colors.white,
      child: Icon(
        Icons.chat,
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
    );
  }
}

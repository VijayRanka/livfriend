import 'package:flutter/material.dart';

class SingleSettingsWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Widget child;

  const SingleSettingsWidget(
      {this.title = "-",
      this.onTap,
      this.child = const SizedBox.shrink(),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600]),
                  ),
                ),
                child,
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                  size: 15,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
      ),
    );
  }
}

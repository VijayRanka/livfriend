import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/status_bar_container.dart';

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
    return Column(
      children: [
        const StatusBarContainer(),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: Row(
            children: [
              onTap != null
                  ? SizedBox(
                      height: 25,
                      width: 45,
                      child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: onTap,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    )
                  : const SizedBox.shrink(),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        )
      ],
    );
  }
}

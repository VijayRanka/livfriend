import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final int index;
  final String imagePath, title, message, date, totalCount;
  final bool isLast;

  const MessageWidget(
      {this.index = 0,
      this.imagePath = "",
      this.title = "",
      this.isLast = false,
      this.message = "",
      this.date = "",
      this.totalCount = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: index == 0 ? 15 : 12,
              bottom: 15,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/images/logo.png",
                      ))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Hllo kya kar rhain hai.....",
                        style: TextStyle(fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5-Feb",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Text(
                        "7",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: isLast ? Colors.transparent : Colors.pink.withOpacity(0.4),
            height: 1,
          )
        ],
      ),
    );
  }
}

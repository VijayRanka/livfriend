import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/message/message_widget.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            text: "CHATS",
          ),
          Expanded(
            child: Column(
              children: ['Important Notification', 'Madhu', 'Shivangi Sharma']
                  .asMap()
                  .map((key, value) => MapEntry(
                      key,
                      MessageWidget(
                        title: value,
                        index: key,
                        isLast: key == 2,
                      )))
                  .values
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

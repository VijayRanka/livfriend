import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/talk_time_total_text.dart';
import 'package:livefriend/screens/talktime/talk_time_screen.dart';

class TalktimePriceWidget extends StatelessWidget {
  const TalktimePriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const TalktimeScreen()));
      },
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)),
        child: const TalkTimeTotalText(textStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/talk_time_total_text.dart';
import 'package:livefriend/screens/talktime/talk_time_screen.dart';

class TalktimePriceWidget extends StatelessWidget {
  const TalktimePriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const TalktimeScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white, width: 2)),
        child: const TalkTimeTotalText(
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );
  }
}

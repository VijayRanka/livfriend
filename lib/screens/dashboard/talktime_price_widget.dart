import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)),
        child: const Text(
          "\$0",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

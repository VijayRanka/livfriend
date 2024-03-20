import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/talk_time_total_text.dart';
import 'package:livefriend/screens/settings/settings_screen.dart';
import 'package:livefriend/screens/settings/single_settings_widget.dart';
import 'package:livefriend/screens/talktime/talk_time_history.dart';
import 'package:livefriend/screens/talktime/talk_time_screen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonAppBar(text: "Profile"),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green[700]!, Colors.green])),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
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
                      "User67890",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Male, 24",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.blue[700]!,
                                    Colors.blue[900]!
                                  ])),
                          child: Text(
                            "Level 1",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.green[700]!])),
                child: Text(
                  "EDIT",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        SingleSettingsWidget(
          title: "Talktime Transactions",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TalktimeHistory()));
          },
        ),
        SingleSettingsWidget(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TalktimeScreen()));
          },
          title: "Talktime",
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TalkTimeTotalText(
                  textStyle: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w500))),
        ),
        const SingleSettingsWidget(title: "Levels"),
        const SingleSettingsWidget(title: "Rate Us"),
        const SingleSettingsWidget(title: "Refer and get free call"),
        SingleSettingsWidget(
          title: "Settings",
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SettingsScreen()));
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:livefriend/common/common_functions.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/settings/dnd_settings_widget.dart';
import 'package:livefriend/screens/settings/single_settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            text: "Settings",
            onTap: Navigator.of(context).pop,
          ),
          const SingleSettingsWidget(title: "Block List"),
          const SingleSettingsWidget(title: "Privacy Policy"),
          const SingleSettingsWidget(title: "Terms of Use"),
          const DndSettingsWidget(),
          const SingleSettingsWidget(title: "Delete Account"),
          GestureDetector(
            onTap: () {
              PreferenceUtils.setBool(
                Constants.isLogin,
                false,
              ).then((value) {
                PreferenceUtils.setString(
                  Constants.userID,
                  "",
                ).then((value) {
                  CommonFunctions.restartApp();
                });
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red[400]!, Colors.red[500]!])),
              child: const Text(
                "LOGOUT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

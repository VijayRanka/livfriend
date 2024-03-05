import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';

class TalktimeHistory extends StatelessWidget {
  const TalktimeHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonAppBar(
            text: "Talktime History",
            onTap: Navigator.of(context).pop,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  "dhkfdhk",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd",
                  "fhdhfkd"
                ]
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                top: key == 0 ? 10 : 0,
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "\$0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[400],
                              height: 1,
                            )
                          ],
                        )))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

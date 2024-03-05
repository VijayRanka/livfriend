import 'package:flutter/material.dart';

class DndSettingsWidget extends StatefulWidget {
  const DndSettingsWidget({Key? key}) : super(key: key);

  @override
  State<DndSettingsWidget> createState() => _DndSettingsWidgetState();
}

class _DndSettingsWidgetState extends State<DndSettingsWidget> {
  bool? isDNDActivated;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Do not disturb",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: Checkbox(
                    value: isDNDActivated ?? false,
                    onChanged: (value) {
                      setState(() {
                        isDNDActivated = value;
                      });
                    }),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 1,
        )
      ],
    );
  }
}

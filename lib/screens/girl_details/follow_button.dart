import 'package:flutter/material.dart';


class FollowedOrNotWidget extends StatefulWidget {
  final bool isFollowed;

  const FollowedOrNotWidget({this.isFollowed = false, Key? key})
      : super(key: key);

  @override
  State<FollowedOrNotWidget> createState() => _FollowedOrNotWidgetState();
}

class _FollowedOrNotWidgetState extends State<FollowedOrNotWidget> {
  bool isFollowed = false;

  @override
  void initState() {
    initViews();
    super.initState();
  }

  void initViews() {
    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() {
          isFollowed = widget.isFollowed;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFollowed = !isFollowed;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, bottom: 20, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red[400]!, Colors.pink[400]!])),
        child: Text(
          isFollowed ? "✓ Following" : "Follow",
          style:
          TextStyle(color: Colors.white, fontSize: isFollowed ? 14 : 15.5),
        ),
      ),
    );
  }
}

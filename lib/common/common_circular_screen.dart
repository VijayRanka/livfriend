import 'package:flutter/material.dart';

class CommonCircularLoadingScreen extends StatelessWidget {
  final bool isLoading;

  const CommonCircularLoadingScreen({this.isLoading = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink();
  }
}

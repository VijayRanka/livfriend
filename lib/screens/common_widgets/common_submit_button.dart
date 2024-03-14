import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double horizontalPadding, verticalPadding;
  const CustomSubmitButton({this.text="-",this.onTap,this.horizontalPadding=0,this.verticalPadding=0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ))),
        onPressed: onTap,
        child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

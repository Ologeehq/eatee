import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class ButtonSolid extends StatelessWidget {
  ButtonSolid({
    @required this.title,
    @required this.onPressed,
    this.textColor,
    this.bgColor,
    this.height,
  });

  final Color textColor;
  final Color bgColor;
  final String title;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: bgColor,
      elevation: 0.5,
      child: Text(
        title,
        style: kButtonTextStyle.copyWith(
          color: textColor,
        ),
      ),
      height: height ?? 50.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

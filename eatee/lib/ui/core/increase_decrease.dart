import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget increaseDecreaseItemWidget({String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {},
        child: FaIcon(
          FontAwesomeIcons.minusSquare,
          size: 18,
          color: kSecondaryColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          title ?? '2',
          style: kBodyText2.copyWith(color: Colors.grey),
        ),
      ),
      InkWell(
        onTap: () {},
        child: FaIcon(
          FontAwesomeIcons.plusSquare,
          size: 18,
          color: kPrimaryColor,
        ),
      ),
    ],
  );
}

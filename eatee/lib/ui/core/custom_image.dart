import 'package:flutter/material.dart';

Container customImageCard(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * .3,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(.1),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/food2.png'),
      ),
    ),
  );
}

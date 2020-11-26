import 'package:flutter/material.dart';

Widget ratingRow(int rating, {double size, Color color}) {
  int unborderStar = 5 - rating;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      for (int x = 0; x < rating; x++)
        Icon(
          Icons.star,
          size: size ?? 10,
          color: color ?? Colors.black87,
        ),
      for (int x = 0; x < unborderStar; x++)
        Icon(
          Icons.star_outline,
          size: size ?? 10,
          color: color ?? Colors.black87,
        ),
    ],
  );
}

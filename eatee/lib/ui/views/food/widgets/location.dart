import 'package:flutter/material.dart';

Widget locationWidget(String title) {
  return Row(
    children: [
      Icon(
        Icons.location_on,
        size: 10,
      ),
      Text(
        title ?? '',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
      ),
    ],
  );
}

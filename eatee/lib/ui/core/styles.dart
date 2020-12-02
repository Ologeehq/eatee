import 'package:flutter/material.dart';

//app theme color
const kPrimaryColor = Colors.deepOrange;
const kSecondaryColor = Color(0xFF1F2430);
const kButtonInactiveColor = Color(0xFFD6D9DF);
const kButtonTextColor = Color(0xFFFFFFFF);
const kGreyColor = Color(0xFFFAFAFA);
// status color
const kSuccessColor = Color(0xFF8DEC15);
const kFailureColor = Color(0xFFF90B0B);
const kWarningColor = Color(0xFFFFE39A);
const kIndicatorColor = Color(0XFFDA6906);
const kIndicatorInactiveColor = Color(0xFFF9BA83);

// text colors
const kPrimaryTextColor = Color(0xFF151515);
const kSecondaryTextColor = Color(0xFF454545);

// spacing
const kAppMargin = 20.0;
const kAppPadding = 10.0;

// typography

// button text
const kButtonTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Colors.white);

// header text
const kHeadingText1 = TextStyle(
    fontSize: 26.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText2 = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText3 = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText4 = TextStyle(
    fontSize: 13.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);

// body text
const kBodyText1 = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText2 = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText3 = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText4 = TextStyle(
    fontSize: 13.0,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);

final outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: kSecondaryColor, width: 2),
);

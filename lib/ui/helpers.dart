import 'package:flutter/material.dart';

//class containing all the custom styles and other helpers
class UIHelpers {

  //text style for title on Splash Screen
  static TextStyle splashStyle(size) {
    return TextStyle(
        color: Colors.white, fontSize: size, fontWeight: FontWeight.bold);
  }


  //text style for subtitle on Splash Screen
  static TextStyle splashSubStyle(size) {
    return TextStyle(color: Colors.white, fontSize: size, letterSpacing: 8);
  }


  //text style for title of Cards displaying total stats on home screen
  static TextStyle cardTitle(size) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: size);
  }


  //text style for cards displaying total stats
  static TextStyle cardData(size) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: size);
  }


  //text style for title of the application on Home Screen
  static TextStyle titleStyle(size) {
    return TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: 2);
  }


  //text style for headings on the Home Screen
  static TextStyle headingStyle(size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }


  //vertical Sized Box for spacing
  static SizedBox verticalBox(height) {
    return SizedBox(
      height: height,
    );
  }
}

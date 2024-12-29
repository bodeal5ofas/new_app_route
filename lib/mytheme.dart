import 'package:flutter/material.dart';

class MyTheme {
  static Color greenColor = Color(0xff39A552);
  static Color greyColor = Colors.grey;
  static ThemeData LightMode = ThemeData(
    
    primaryColor: greenColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      color: greenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

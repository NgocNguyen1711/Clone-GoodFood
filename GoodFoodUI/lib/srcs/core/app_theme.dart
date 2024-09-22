import 'package:flutter/material.dart';

import 'color_scheme.dart';

final appTheme = ThemeData(
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(0),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: commonDark,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    size: 24,
  ),
  inputDecorationTheme: InputDecorationTheme(
    outlineBorder: const BorderSide(color: Colors.black, width: 1.5),
    prefixIconColor: userTints1,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: userTints4,
        width: 1.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1.5, color: Colors.black),
    ),
    floatingLabelStyle: const TextStyle(
      fontSize: 18,
      color: userTints1,
    ),
    labelStyle: const TextStyle(
      fontSize: 16,
    ),
    focusColor: userTints4,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(
      size: 30,
      color: commonDark,
    ),
    titleTextStyle: TextStyle(
      color: commonDark,
      fontSize: 20,
    ),
  ),
  fontFamily: 'OpenSans',
);

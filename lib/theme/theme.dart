import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'SFProDisplay',
  //brightness: Brightness.light,
  // inputDecorationTheme: const InputDecorationTheme(
  //     border: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink))),
  // disabledColor: const Color(0xffB7B7BC),
  // focusColor: const Color(0xff222222),
  errorColor: const Color(0xffCF6679),
  // unselectedWidgetColor: const Color(0xffFFFFFF),
  // selectedRowColor: const Color(0xffFFFDE7),
  // indicatorColor: const Color(0xffB7B7BC),
  // primaryColor: const Color(0xffFDB913),
  // dialogBackgroundColor: const Color(0xffFAFAFA),
  // dividerColor: const Color(0xffB7B7BC),
  highlightColor: const Color(0xff858585),
  // secondaryHeaderColor: const Color(0xffFAFAFA),
  //scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    // headlineLarge: TextStyle(
    //     color: Color(0xffFFFFFF),
    //     fontSize: 24,
    //     fontWeight: FontWeight.bold,
    //     height: 1.4),
    headlineMedium: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.4),
    headlineSmall: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.4),
    labelMedium: TextStyle(
      color: Color.fromARGB(255, 124, 121, 121),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
        color: Color(0xff757577),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4),
    // titleMedium: TextStyle(
    //     color: Color(0xff222222),
    //     fontSize: 16,
    //     fontWeight: FontWeight.normal,
    //     height: 1.4),
    // bodyLarge: TextStyle(
    //     height: 1.5,
    //     fontSize: 16,
    //     color: Color(0xFF222222),
    //     fontWeight: FontWeight.normal),
    // bodySmall: TextStyle(
    //     height: 1.5,
    //     fontSize: 16,
    //     color: Color(0xFF585858),
    //     fontWeight: FontWeight.normal),
  ),
);

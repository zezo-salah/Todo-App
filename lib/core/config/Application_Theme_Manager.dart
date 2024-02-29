
import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white, size: 28, weight: 10),
      elevation: 0,
      toolbarHeight: 110,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "Pop",
          fontSize: 24),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      selectedItemColor: primaryColor,
      // selectedLabelStyle: TextStyle(fontFamily: "Pop", color: Colors.black),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB),
        size: 30,
      ),
      unselectedItemColor: Color(0xFFC8C9CB),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      padding: EdgeInsets.zero,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(width: 4.5, color: Colors.white),
      ),
    ),
    // textTheme:  TextTheme(
    //   titleLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 22,
    //     fontWeight:FontWeight.bold,
    //     color: Colors.black,
    //   ),
    //   bodyLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 20,
    //     fontWeight:FontWeight.w800,
    //     color: Colors.black,
    //   ),
    //   bodyMedium:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 18,
    //     fontWeight:FontWeight.w700,
    //     color: Colors.black,
    //   ),
    //   bodySmall:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 14,
    //     fontWeight:FontWeight.w700,
    //     color: Colors.black,
    //   ),
    //   displayLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 15,
    //     fontWeight:FontWeight.w400,
    //     color: Colors.black,
    //   ),
    // )
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF060E1E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 28, weight: 10),
      toolbarHeight: 110,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Color(0xFF060E1E),
          fontWeight: FontWeight.bold,
          fontFamily: "Pop",
          fontSize: 24),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      showSelectedLabels: true,
      selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      unselectedLabelStyle:
          TextStyle(fontFamily: "Pop", color: Color(0xFFC8C9CB)),
      unselectedItemColor: Color(0xFFC8C9CB),
      unselectedIconTheme: IconThemeData(color: Color(0xFFC8C9CB), size: 30),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFF060E1E),
      padding: EdgeInsets.zero,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          width: 4.5,
          color: Color(0xFF141922),
        ),
      ),
    ),
    // textTheme:  TextTheme(
    //   titleLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 22,
    //     fontWeight:FontWeight.bold,
    //     color: Colors.black,
    //   ),
    //   bodyLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 20,
    //     fontWeight:FontWeight.w900,
    //     color: Colors.black,
    //   ),
    //   bodyMedium:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 18,
    //     fontWeight:FontWeight.w800,
    //     color: Colors.black,
    //   ),
    //   bodySmall:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 14,
    //     fontWeight:FontWeight.w700,
    //     color: Colors.black,
    //   ),
    //   displayLarge:TextStyle(
    //     fontFamily: "Pop",
    //     fontSize: 15,
    //     fontWeight:FontWeight.w500,
    //     color: Colors.black,
    //   ),
    // )
  );
}

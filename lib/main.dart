import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/screens/homepage.dart';
import 'package:masante228/screens/splash.dart';
import 'package:sizer/sizer.dart';

import 'main2.dart';
import 'utils/custom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Masante228',
          theme: buildThemeData(),
          home: const Splash(),
        );
      },
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.yantramanav(
          fontSize: 22.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        headlineMedium: GoogleFonts.yantramanav(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        displaySmall: GoogleFonts.yantramanav(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        displayMedium: GoogleFonts.yantramanav(
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        bodyLarge: GoogleFonts.yantramanav(
          fontSize: 12.0.sp,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium:
            GoogleFonts.yantramanav(fontSize: 14.0.sp, letterSpacing: 1.0),
        headlineSmall:
            GoogleFonts.yantramanav(fontSize: 16.0.sp, letterSpacing: 1.0),
      ),
      splashColor: const Color(0xff1651DA),
    );
  }
}

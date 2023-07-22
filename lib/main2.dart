import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/intro_page.dart';


class Qrcode extends StatelessWidget {
  const Qrcode({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masante',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:const Color.fromARGB(255, 230, 232, 235),
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineSmall: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      
      home: const IntroPage(),
    );
  }
}

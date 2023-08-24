import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/screens/provider/page_provider.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/screens/splash.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> PageProvider()),
        ChangeNotifierProvider(create: (_)=> UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Masante228",
        theme: ThemeData(
          useMaterial3: true,
          tabBarTheme: TabBarTheme(
            indicatorColor: kPrimaryColor,
            labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500,),
          ),
          textTheme: TextTheme(
           bodyLarge: GoogleFonts.poppins(fontSize: 18, color: kBlackColor),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: kWhiteColor
            ),
            elevation: 0
          ),
          scaffoldBackgroundColor: kPrimaryColor /* Colors.grey[300] */,
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            fillColor: kWhiteColor,
            filled: true
          )
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
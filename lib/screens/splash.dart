import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masante228/screens/homepage.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';

import 'authentificate/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Image.asset(
          kImagePath(imageName: "logo.jpeg"),
        ),
      ),
    );
  }
}

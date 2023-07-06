import 'package:flutter/material.dart';
import 'package:masante228/screens/homepage.dart';
import 'package:masante228/screens/login.dart';

import 'données/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FingerprintAuthenticationScreen(),

    );
  }
}

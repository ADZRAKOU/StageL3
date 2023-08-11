import 'package:flutter/material.dart';
import 'package:masante228/screens/provider/page_provider.dart';
import 'package:masante228/screens/splash.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
      child: MaterialApp(
        title: "Masante",
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.grey[300],
            inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: kWhiteColor,
                filled: true)),
        home: const SplashScreen(),
      ),
    );
  }
}

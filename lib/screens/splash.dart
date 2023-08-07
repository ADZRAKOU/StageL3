import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      SharedPreferences.getInstance().then((prefernces) async {
        //await prefernces.remove('login');
        final l = prefernces.getBool('login');
        print(l == null);
        if (l == null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          if (kDebugMode) {
            print(l == null);
          }
          if (kDebugMode) {
            print(57198456524);
          }
          return;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      });
    });

    return Scaffold(
        body: Column(
      children: [
        Image.asset('assets/images/logo.jpeg'),
        const Text(
          'Bienvenue',
          style: TextStyle(
              color: Color.fromARGB(255, 1, 27, 71),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}

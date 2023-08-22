import 'package:flutter/material.dart';
import 'package:masante228/screens/authentificate/email_verify.dart';
import 'package:masante228/screens/calender_page.dart';
import 'package:masante228/screens/dashboard.dart';
import 'package:masante228/screens/editprofil_page.dart';
import 'package:masante228/screens/home_page.dart';
import 'package:masante228/screens/rendez_vous.dart';
import 'package:masante228/screens/welcome/welcome_screen.dart';

import 'authentificate/medecin_login.dart';
import 'authentificate/signin_screen.dart';
import 'authentificate/signup_page.dart';
import 'choix.dart';

class Choix extends StatelessWidget {
  const Choix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond bleu
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            //height: 400,
          ),
          Container(
            margin: const EdgeInsets.only(top: 00),
            child: const Text(
              "Votre santé notre priorité",
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 27, 71),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                  (route) => false);
            },
            child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 66, 121, 237)),
                child: const Text(" Patient ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 215, 221, 226),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          )
        ]),
      ),
    );
  }
}

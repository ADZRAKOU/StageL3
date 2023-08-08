import 'package:flutter/material.dart';
import 'package:masante228/screens/rendez_vous.dart';
import 'package:masante228/screens/welcome/welcome_screen.dart';

import 'choix.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond bleu
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.jpeg',
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
              
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const  Choix()),
    );
            },
            
            child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                   color: const Color.fromARGB(255, 66, 121, 237)),
                child: const Text(" Commencer",
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

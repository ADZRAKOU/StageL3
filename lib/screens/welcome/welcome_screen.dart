import 'package:masante228/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masante228/models/personne.dart';
import 'package:masante228/screens/authentificate/medecin_login.dart';
import 'package:masante228/screens/authentificate/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/logo.png'),
          //height: 400,
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(
                    "assets/icons/gerda_logo.svg",
                  ),
                  Spacer(),
                  // As you can see we need more paddind on our btn
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedecinLogin(),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 43, 122, 240),
                      ),
                      child: Text("S'inscrire"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            )),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 36, 85, 248),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 233, 231, 228)),
                          ),
                        ),
                        child: const Text("Se connecter"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

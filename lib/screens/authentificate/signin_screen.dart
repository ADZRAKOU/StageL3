import 'package:flutter/material.dart';
import 'package:masante228/screens/authentificate/signup_page.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/button_widget.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/text_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kSize(context).height / 3.2,
              child: Center(
                child: Image.asset(
                  kImagePath(imageName: "logo.jpeg"),
                ),
              ),
            ),
            Container(
              height: kSize(context).height - kSize(context).height / 3.2,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 234, 234),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextWidget(
                    data: "CONNEXION",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    data: "Bienvenue",
                    color: kGreyColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InputWidget(placeholder: "Email"),
                  ),
                  InputWidget(placeholder: "Password"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Center(
                        child: ButtonWidget(
                            width: kSize(context).width / 2,
                            child: "Se connecter")),
                  ),
                  Center(
                      child: TextWidget(
                    data: "Mot de passe oublie",
                    color: kGreyColor,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 50),
            /* InkWell(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            })*/
          ],
        ),
      ),
    );
  }
}

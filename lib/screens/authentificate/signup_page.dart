import 'package:flutter/material.dart';
import 'package:masante228/screens/home_screen.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/button_widget.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    data: "Votre santé, Notre priorité",
                    color: kGreyColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InputWidget(placeholder: "Nom"),
                  ),
                  const InputWidget(placeholder: "Prenom"),
                  const InputWidget(placeholder: "Email"),
                  const InputWidget(placeholder: "Contact"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Center(
                        child: ButtonWidget(
                            width: kSize(context).width / 2,
                            child: "S'inscrire")),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            InkWell(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            })
          ],
        ),
      ),
    );
  }
}

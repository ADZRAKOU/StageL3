import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/screens/dashboard.dart';
import 'package:masante228/screens/home_page.dart';
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
            SizedBox(
              height: kSize(context).height / 3.2,
              child: Center(
                child: Image.asset(
                  kImagePath(imageName: "logo.png"),
                ),
              ),
            ),
            Container(
              height: kSize(context).height - kSize(context).height / 3.2,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextWidget(
                    data: "INSCRIPTION",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InputWidget(placeholder: "Nom"),
                  ),
                  const InputWidget(placeholder: "Prenom"),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const InputWidget(placeholder: "Email"),
                  ),
                  const InputWidget(placeholder: "Password"),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const InputWidget(placeholder: "Contact"),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonWidget(
                        //width: kSize(context).width / 2,
                        child: "Sinscrire",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

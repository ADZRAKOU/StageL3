import 'package:flutter/material.dart';
import 'package:masante228/screens/authentificate/signup_page.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/button_widget.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'email_verify.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late UserProvider userProvider;
  String email = "";
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    userProvider.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    userProvider.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(userProvider.status);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: key,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InputWidget(
                        placeholder: "Email",
                        onChanged: (p0) {
                          email = p0;
                        },
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "le champ ne peut etre vide";
                          }
                          if (!p0.contains("@")) {
                            return "le mail n'est pas valide";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(
                          child: ButtonWidget(
                              width: kSize(context).width / 2,
                              child: "Se connecter",
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  userProvider.signInUser(email: email);
                                }
                              })),
                    ),
                    Center(
                        child: TextWidget(
                      data: "Mot de passe oublie",
                      color: kGreyColor,
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Avez vous un compte?",
                              style: GoogleFonts.poppins(color: kGreyColor)),
                          TextSpan(
                              text: " Inscrivez-vous",
                              style: GoogleFonts.poppins(color: kPrimaryColor))
                        ]),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  listener() {
    final st = userProvider.status;
    final user = userProvider.user;
    if (st == Status.loading) {
      showLoaderDialog(context);
    } else if (st == Status.loaded) {
      if (user != null) {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => EmailVerify(
              email: email,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SignUpPage(
              email: email,
              isUser: false,
            ),
          ),
        );
      }
    } else if (st == Status.error) {
      Navigator.pop(context);
      kSnackBar(context, 'une erreur sest produite', color: Colors.red);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/screens/authentificate/signin_screen.dart';
import 'package:masante228/screens/dashboard.dart';
import 'package:masante228/screens/home_page.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/button_widget.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../provider/user_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.email});

  final String email;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late UserProvider userProvider;
  String nom = "";
  String prenom = "";
  String contact = "";
  String genre = "";

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
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: key,
        child: SingleChildScrollView(
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
                      data: "INSCRIPTION",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InputWidget(
                        placeholder: "Nom",
                        onChanged: (p0) {
                          nom = p0;
                        },
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return "le champ ne peux etre vide";
                          }
                        },
                      ),
                    ),
                    InputWidget(
                      placeholder: "Prenom",
                      onChanged: (p0) {
                        prenom = p0;
                      },
                      validator: (p0) {
                        if (p0 == null || p0.trim().isEmpty) {
                          return "le champ ne peux etre vide";
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InputWidget(
                        placeholder: "genre",
                        onChanged: (p0) {
                          genre = p0;
                        },
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return "le champ ne peux etre vide";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InputWidget(
                        placeholder: "Contact",
                        onChanged: (p0) {
                          contact = p0;
                        },
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return "le champ ne peux etre vide";
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ButtonWidget(
                              //width: kSize(context).width / 2,
                              child: "Sinscrire",
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  print('[$genre]');
                                  userProvider.signUpUser(
                                      nom: nom,
                                      contact: contact,
                                      email: widget.email,
                                      genre: genre.trim(),
                                      prenom: prenom);
                                }
                              })

                          /* Navigator.pushAndRemoveUntil(
                                context,
                                slidableRoute(nextPage: const HomePage()),
                                (route) => false);*/
                          /*  Navigator.push(
                                context,
                                MaterialPageRoute(
             ),*/
                          ),
                    ),
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
    if (st == Status.loading) {
      showLoaderDialog(context);
    } else if (st == Status.loaded) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else if (st == Status.error) {
      Navigator.pop(context);
      kSnackBar(context, "Une erreur s'est produite", color: Colors.red);
    } else if (st == Status.exist) {
      Navigator.pop(context);
      kSnackBar(context, 'Ce mail existe déjà');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }
}

import 'dart:convert';

import 'package:masante228/constants.dart';
import 'package:masante228/screens/authentificate/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'components/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  get token => null;

  get id => null;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  late String _userName,
      _email,
      _password,
      _phoneNumber,
      _role,
      _dateNaissance,
      _genre,
      _specialite,
      _autreContact,
      _adresse,
      _estAssure,
      _typeAssurance,
      _estActive;

  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();
  final id = TextEditingController();

  final first_nameController = TextEditingController();

  final last_nameController = TextEditingController();

  final emailController = TextEditingController();

  final date_naissanceController = TextEditingController();

  final roleController = TextEditingController();

  final genreController = TextEditingController();

  final specialiteController = TextEditingController();

  final contactController = TextEditingController();

  final autre_contactController = TextEditingController();

  final adresseController = TextEditingController();

  String accountType = 'Patient';

  /*late SharedPreferences preferences;
  void initBackground() async{preferences=await SharedPreferences.getInstance}*/
  bool isCreating = false;

  Future<void> createPatient(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isCreating = true;
      });
      print(
        first_nameController.value.text.toString(),
      );

      print(
        last_nameController.value.text.toString(),
      );

      http.Response response = await http.post(
          Uri.parse("http://localhost:8000/api/accounts/users/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Token ${widget.token}',
          },
          body: jsonEncode(<String, String>{
            'patient': "${widget.id}",
            'last_name': last_nameController.value.text.toString(),
            'first_name': first_nameController.value.text.toString(),
            'contact': contactController.value.text.toString(),
            'role': roleController.value.text.toString(),
            'genre': genreController.value.text.toString(),
            'date_naissance': date_naissanceController.value.text.toString(),
            'specialité': roleController.value.text.toString(),
            'autreContact': autre_contactController.value.text.toString(),
            'adresse': adresseController.value.text.toString(),
          }));

      var data = jsonDecode(response.body);

      print(data);
      if (data['success'] == true) {
        await prefs.setString(
          'first_name',
          first_nameController.value.text.toString(),
        );
        await prefs.setString(
          'last_name',
          last_nameController.value.text.toString(),
        );
        await prefs.setBool('login', true);

        await prefs.setString(
          'email',
          emailController.value.text.toString(),
        );

        await prefs.setString(
          'contact',
          contactController.value.text.toString(),
        );

        await prefs.setString(
          'date_naissance',
          date_naissanceController.value.text.toString(),
        );

        // ignore: use_build_context_synchronously
        await showDialog(
            // context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: const Text("Succes"),
                content: const Text("Patient enregistre avec success !"),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
            context: context);
      }
    } catch (e) {
      print("RRRRRRRRRRRRRRRR");
      print(e);
    }

    setState(() {
      isCreating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
            // Now it takes 100% of our height
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const TextFieldName(text: "Nom"),
                              TextFormField(
                                controller: last_nameController,

                                decoration:
                                   const InputDecoration(hintText: "masanté"),                      
                                validator: RequiredValidator(errorText: "Nom "),
                                // Let's save our username
                                onSaved: (username) => _userName = username!,
                              ),


                            
                           const TextFieldName(text: "Prenom"),
                              TextFormField(
                                controller: last_nameController,

                                decoration:
                                    const InputDecoration(hintText: "masanté"),                      
                                validator: RequiredValidator(errorText: "Nom "),
                                // Let's save our username
                                onSaved: (username) => _userName = username!,
                              ),

                              const SizedBox(height: defaultPadding),
                              // We will fixed the error soon
                              // As you can see, it's a email field
                              // But no @ on keybord
                             const TextFieldName(text: "Email"),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                const InputDecoration(hintText: "test@email.com"),
                                validator: EmailValidator(
                                    errorText: "Use a valid email!"),
                                onSaved: (email) => _email = email!,
                              ),
                              const SizedBox(height: defaultPadding),
                             const TextFieldName(text: "Contact"),
                              // Same for phone number
                              TextFormField(
                                controller: contactController,
                                keyboardType: TextInputType.phone,
                                decoration:
                                 const   InputDecoration(hintText: "+22892485339"),
                                validator:
                                    RequiredValidator(errorText: "Contact"),
                                onSaved: (phoneNumber) =>
                                    _phoneNumber = phoneNumber!,
                              ),
                              const SizedBox(height: defaultPadding),
                              const TextFieldName(text: "Mot de passe "),

                              TextFormField(
                                enabled: true,

                                // We want to hide our password
                                obscureText: true,
                                decoration:const InputDecoration(hintText: "******"),
                                validator: passwordValidator,
                                onSaved: (password) => _password = password!,
                                // We also need to validate our password
                                // Now if we type anything it adds that to our password
                                onChanged: (pass) => _password = pass,
                              ),
                            const TextFieldName(text: "Role"),

                              TextFormField(
                                controller: roleController,
                                enabled: true,

                                decoration:const InputDecoration(hintText: "role"),
                                validator:
                                    RequiredValidator(errorText: "Role "),
                                // Let's save our username
                                onSaved: (role) => _role = role!,
                              ),

                              const TextFieldName(text: "DateNaissance"),

                              TextFormField(
                                //controller=date_naissanceController,
                                enabled: true,

                                decoration:
                                  const  InputDecoration(hintText: "dateNaissance"),
                                validator: RequiredValidator(
                                    errorText: "dateNaissance "),
                                // Let's save our username
                                onSaved: (dateNaissance) =>
                                    _dateNaissance = dateNaissance!,
                              ),

                             const TextFieldName(text: "Genre"),

                              TextFormField(
                                controller: genreController,
                                decoration:const InputDecoration(hintText: "genre"),
                                //validator: RequiredValidator(errorText: "genre "),
                                // Let's save our username
                                // onSaved: (genre) => _genre = genre!,
                              ),
                             const TextFieldName(text: "Specialite"),

                              TextFormField(
                                enabled: true,

                                decoration:
                                  const  InputDecoration(hintText: "specialite"),
                                validator:
                                    RequiredValidator(errorText: "specialite "),
                                // Let's save our username
                                onSaved: (specialite) =>
                                    _specialite = specialite!,
                              ),

                             const TextFieldName(text: "AutreContact"),

                              TextFormField(
                                controller: autre_contactController,
                                enabled: true,

                                decoration:
                                   const InputDecoration(hintText: "autreContact"),
                                validator: RequiredValidator(
                                    errorText: "autreContact "),
                                // Let's save our username
                                onSaved: (autreContact) =>
                                    _autreContact = autreContact!,
                              ),
                             const TextFieldName(text: "Adresse"),

                              TextFormField(
                                controller: adresseController,
                                enabled: true,

                                decoration:
                                  const  InputDecoration(hintText: "adresse"),
                                validator:
                                    RequiredValidator(errorText: "adresse "),
                                // Let's save our username
                                onSaved: (adresse) => _adresse = adresse!,
                              ),
                             const TextFieldName(text: "EstAssuree"),

                              TextFormField(
                                enabled: true,

                                decoration:
                                  const InputDecoration(hintText: "estAssuree"),
                                validator:
                                    RequiredValidator(errorText: "estAssuree "),
                                // Let's save our username
                                onSaved: (estAssuree) =>
                                    _estAssure = estAssuree!,
                              ),

                            const TextFieldName(text: "TypeAssurance"),

                              TextFormField(
                                enabled: true,

                                decoration:
                                  const  InputDecoration(hintText: "typeAssurance"),
                                validator: RequiredValidator(
                                    errorText: "typeAssurance "),
                                // Let's save our username
                                onSaved: (typeAssurance) =>
                                    _typeAssurance = typeAssurance!,
                              ),
                             const TextFieldName(text: "EstActive"),

                              TextFormField(
                                enabled: true,
                                decoration:
                                  const  InputDecoration(hintText: "estActive"),
                                validator:
                                    RequiredValidator(errorText: "estActive "),
                                // Let's save our username
                                onSaved: (active) => _estActive = active!,
                              ),

                              const SizedBox(height: defaultPadding),
                            const  TextFieldName(text: "Confirmez le mot de passe"),
                              TextFormField(
                                obscureText: true,
                                decoration:const InputDecoration(hintText: "*****"),
                                validator: (pass) => MatchValidator(
                                        errorText: "Password do not  match")
                                    .validateMatch(pass!, _password),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Créer votre compte",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                         const Text("Avez-vous déjà un compte?"),
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                )),
                            child: const Text(
                              "Se connecter!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      //SignUpForm(formKey: _formKey),
                      //const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              /*BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                            );*/

                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                createPatient(context);

                                /* final connexion = await http.post(
                                    Uri.parse(
                                        "http://localhost:8000/api/accounts/users/"),
                                    body: {
                                      "id": "id",
                                      "last_name": "last_name",
                                      "first_name": "first_name",
                                      "email": "email",
                                      "role": "patient",
                                      "date_naissance":
                                          "2023-07-24T22:21:44.410Z",
                                      "genre": "masculin",
                                      "specialite": "string",
                                      "contact": "string",
                                      "autre_contact": "string",
                                      "adresse": "string",
                                      "est_assuree": "true"
                                    });
                                var data = jsonDecode(connexion.body);
                                /*
                                if (data['token']!=null){
                                  
                                }*/
                                print(connexion);

                                print(data);
                                print("PPPPPPPPPPPPPPPPPPPPPP");*/
                              }
                            } catch (e) {
                              print(e);
                              print("IIIIIIIIIIIIIIIII");
                            }
                          },
                          child: const Text("S'inscrire"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style:const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

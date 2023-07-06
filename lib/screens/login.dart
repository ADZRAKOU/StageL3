import 'package:flutter/material.dart';
import 'package:masante228/screens/principale_page.dart';
import 'package:masante228/screens/register.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;

  // Email Validation
  final emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool validateEmail(String email) {
    final regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  // Sign In Function
  void login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        isLoading = false;
        setState(() {});
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Votre santé, Notre priorité',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                "assets/images/logo.jpeg",
                height: 200,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veillez entrer votre Email';
                        }
                        if (!validateEmail(_emailController.text)) {
                          return 'Veillez entrer un Email valide';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Entrer votre Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0),
                            borderSide: BorderSide.none,
                           ),
                          fillColor: Color.fromARGB(255, 6, 81, 244),
                          focusColor: Colors.white),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: showPassword ? false : true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrer votre mots de passe';
                        }
                        if (value.length < 6) {
                          return 'Mots de passe doit avoir 8 caractères';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Entrer votre mot de passe',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.security,
                          color: Colors.grey,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                          borderSide: BorderSide.none,
                        ),
                         fillColor: Color.fromARGB(255, 6, 81, 244),
                        focusColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {

              
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignupPage()),
                        );
                        
                        login();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 81, 244),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Center(
                          child: isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Connexion',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
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
}

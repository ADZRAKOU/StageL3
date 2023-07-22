import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginPage({super.key});

  void _signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      // Connexion réussie avec le compte Google
    } catch (error) {
      // Erreur lors de la connexion avec le compte Google
      print('Erreur de connexion Google : $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('Se connecter avec Google'),
        ),
      ),
    );
  }
}

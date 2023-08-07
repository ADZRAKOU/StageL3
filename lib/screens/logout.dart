import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are you sure you want to logout?'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
//await _auth.signOut(); // Déconnexion avec Firebase Auth
                Navigator.pop(context); // Revenir à l'écran précédent
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

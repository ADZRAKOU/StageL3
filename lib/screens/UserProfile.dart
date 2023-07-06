import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImage;

  UserProfilePage({required this.userName, required this.userEmail, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil utilisateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(userImage),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(userEmail),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil utilisateur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfilePage(
        userName: 'John Doe',
        userEmail: 'johndoe@example.com',
        userImage: 'https://example.com/user_profile_image.jpg',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:masante228/screens/menu.dart';
import 'package:masante228/screens/prise.dart';
import 'package:masante228/screens/rendez_vous.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        cardColor: Color.fromARGB(255, 6, 81, 244),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List<String> genders = ['Masculin', 'Féminin', 'Autre'];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration:const InputDecoration(labelText: 'Nom'),
            ),
          const  SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration:const InputDecoration(labelText: 'Adresse e-mail'),
            ),
           const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              decoration:const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
           const SizedBox(height: 16),
            TextFormField(
              controller: ageController,
              decoration:const InputDecoration(labelText: 'Âge'),
              keyboardType: TextInputType.number,
            ),
           const SizedBox(height: 16),
            DropdownButtonFormField(
              decoration:const InputDecoration(labelText: 'Genre'),
              onChanged: (value) {
                setState(() {
                });
              },
              items: genders.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
            ),
           const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton S'inscrire est cliqué
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                int? age = int.tryParse(ageController.text);

                // Effectuer les opérations nécessaires, par exemple, enregistrer les informations dans la base de données

                // Naviguer vers la page des menus
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentForm(),
                  ),
                );
              },
              child:const Text('S\'inscrire'),
            ),
           const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Action à effectuer lorsque le lien J'ai déjà un compte est cliqué
              },
              child:const Text('J\'ai déjà un compte'),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  // Les données du patient (remplacez ceci par vos vraies données)
  final String patientName = "John Doe";
  final DateTime dateOfBirth = DateTime(1990, 8, 25);
  final String contact = "+1 123-456-7890";
  final String gender = "Masculin";

  Home({super.key});
  // Vous pouvez ajouter plus d'informations du patient ici...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue, $patientName !',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 20),
           const  Text(
              'Informations du patient:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Nom: $patientName'),
            Text('Date de naissance: ${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}'),
            Text('Contact: $contact'),
            Text('Genre: $gender'),


            
            // Ajoutez plus d'informations du patient ici...
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String reason = '';
  String contact = '';
  String email = '';
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prise de rendez-vous'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isConfirmed ? _buildConfirmationMessage() : _buildAppointmentForm(),
      ),
    );
  }

  Widget _buildAppointmentForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration:const  InputDecoration(labelText: 'Prénom'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre prénom';
              }
              return null;
            },
            onSaved: (value) => firstName = value!,
          ),
          TextFormField(
            decoration:const  InputDecoration(labelText: 'Nom'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre nom';
              }
              return null;
            },
            onSaved: (value) => lastName = value!,
          ),
          TextFormField(
            decoration:const InputDecoration(labelText: 'Motif du rendez-vous'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer le motif du rendez-vous';
              }
              return null;
            },
            onSaved: (value) => reason = value!,
          ),
          TextFormField(
            decoration:const  InputDecoration(labelText: 'Contact'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer un contact';
              }
              return null;
            },
            onSaved: (value) => contact = value!,
          ),
          TextFormField(
            decoration:const  InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer une adresse email';
              }
              // Vous pouvez ajouter une validation d'email ici si nécessaire
              return null;
            },
            onSaved: (value) => email = value!,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                // Vous pouvez enregistrer les données ici dans une base de données ou les traiter selon vos besoins.
                // Pour cet exemple, nous allons simplement afficher le message de confirmation.
                setState(() {
                  isConfirmed = true;
                });
              }
            },
            child: const Text('Prendre rendez-vous'),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationMessage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, size: 48, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Merci! Votre rendez-vous a été enregistré.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

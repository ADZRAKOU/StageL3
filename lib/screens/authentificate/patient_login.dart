import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:backdrop/backdrop.dart';

import '../home.dart';

class PatientRegistrationForm extends StatefulWidget {
  const PatientRegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PatientRegistrationFormState createState() =>
      _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late DateTime _selectedDate; // Variable pour stocker la date de naissance

  late String _selectedGender;

  var DatePicker;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription Patient'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre adresse e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // To hide the password input
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  }
                  if (value.length < 8) {
                    return 'Le mot de passe doit contenir au moins 8 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez confirmer le mot de passe';
                  }
                  if (value != _passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Contact',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre numéro de contact';
                  }
                  return null;
                },
              ),
              /*
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                items: <String>['Masculin', 'Féminin', 'Autre']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez sélectionner votre genre';
                  }
                  return null;
                },
              ),*/
              /*
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Afficher le sélecteur de date de naissance lorsque le bouton est pressé

                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(1900),
                    maxTime: DateTime.now(),
                    onChanged: (date) {
                      // Le sélecteur de date appelle cette fonction à chaque changement de date
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    onConfirm: (date) {
                      // Le sélecteur de date appelle cette fonction lorsque l'utilisateur confirme la date
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    currentTime: _selectedDate,
                    // locale: LocaleType.fr, // Vous pouvez changer la langue ici
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  _selectedDate != null
                      ? 'Date de naissance : ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                      : 'Sélectionner une date de naissance',
                  style:const  TextStyle(fontSize: 16),
                ),
              ),
*/

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Tous les champs sont valides, effectuez l'enregistrement ici
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;
                    String email = _emailController.text;
                    String contact = _contactController.text;
                    String gender = _selectedGender;
                    String password = _passwordController.text;

                    // Traitez les données ici ou envoyez-les à votre backend, base de données, etc.
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'S\'inscrire',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 1, 27, 71),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

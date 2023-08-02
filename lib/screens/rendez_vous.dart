import 'package:flutter/material.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  bool _formValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Réinitialiser la validation des champs
    setState(() {
      _formValid = true;
    });

    // Obtenir les valeurs des champs du formulaire
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String date = _dateController.text.trim();
    String time = _timeController.text.trim();

    // Effectuer les contrôles de validation
    if (name.isEmpty || email.isEmpty || phone.isEmpty || date.isEmpty || time.isEmpty) {
      setState(() {
        _formValid = false;
      });
      return;
    }

    // Envoyer les données à votre backend ou effectuer toute autre logique de traitement

    // Réinitialiser le formulaire
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _dateController.clear();
    _timeController.clear();

    // Afficher une confirmation ou effectuer une autre action après la soumission du formulaire
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rendez-vous pris'),
          content: Text('Votre rendez-vous a été enregistré avec succès.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prise de rendez-vous'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom',
                errorText: !_formValid && _nameController.text.isEmpty ? 'Veuillez saisir votre nom' : null,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: !_formValid && _emailController.text.isEmpty ? 'Veuillez saisir votre email' : null,
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Téléphone',
                errorText: !_formValid && _phoneController.text.isEmpty ? 'Veuillez saisir votre numéro de téléphone' : null,
              ),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                errorText: !_formValid && _dateController.text.isEmpty ? 'Veuillez saisir une date' : null,
              ),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Heure',
                errorText: !_formValid && _timeController.text.isEmpty ? 'Veuillez saisir une heure' : null,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Prendre rendez-vous'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AppointmentForm(),
  ));
}

import 'package:flutter/material.dart';
import 'package:masante228/screens/UserProfile.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Traitez les données du formulaire (envoi à une API, sauvegarde dans une base de données, etc.)
      // Affichez un message de succès ou effectuez une autre action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prise de Rendez-vous'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Remplissez le formulaire pour prendre un rendez-vous :',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prenom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre Prenom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre Age';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Téléphone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre numéro de téléphone';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Date du rendez-vous'),
                subtitle: Text(_selectedDate.toString()),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Heure du rendez-vous'),
                subtitle: Text(_selectedTime.format(context)),
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        userEmail: '',
                        userImage: '',
                        userName: '',
                      ),
                    ),
                  );
                },
                child: const Text('Prendre un rendez-vous'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

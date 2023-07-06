import 'package:flutter/material.dart';
import 'package:masante228/screens/prise.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
late DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prise de Rendez-vous'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sélectionnez une date et une heure pour votre rendez-vous :',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Sélectionner une date'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Sélectionner une heure'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Date sélectionnée : ${selectedDate}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Heure sélectionnée : ${selectedTime}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentForm(),
                  ),
                );
                // Enregistrer le rendez-vous et afficher un message de confirmation
              },
              child: Text('Confirmer le rendez-vous'),
              
            ),
          ],
        ),
      ),
    );
  }
}

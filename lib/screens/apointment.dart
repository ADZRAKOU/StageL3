import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/text_widget.dart';

import '../utils/utils.dart';
import '../widgets/rdv_widget.dart';


import 'dart:math';



// Classe pour représenter un créneau horaire
class TimeSlot {
  final TimeOfDay from;
  final TimeOfDay to;

  TimeSlot({required this.from, required this.to});

  // Méthode pour convertir un TimeOfDay en String
  String timeToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  // Méthode pour afficher le créneau horaire sous la forme 'de ... à ...'
  @override
  String toString() {
    return 'de ${timeToString(from)} à ${timeToString(to)}';
  }
}

// Classe pour représenter un jour de la semaine
class Day {
  final String name;
  final DateTime date;

  Day({required this.name, required this.date});
}

// Classe pour représenter la page principale de l'application
class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

// Classe pour gérer les données et la logique de la page principale
class _AppointmentPageState extends State<AppointmentPage> {
  // Liste des créneaux horaires disponibles
  List<TimeSlot> timeSlots = [];

  // Liste des jours de la semaine
  List<Day> days = [
    Day(name: 'Lun', date: DateTime(2023, 8, 21)),
    Day(name: 'Mar', date: DateTime(2023, 8, 22)),
    Day(name: 'Mer', date: DateTime(2023, 8, 23)),
    Day(name: 'Jeu', date: DateTime(2023, 8, 24)),
    Day(name: 'Ven', date: DateTime(2023, 8, 25)),
    Day(name: 'Sam', date: DateTime(2023, 8, 26)),
    Day(name: 'Dim', date: DateTime(2023, 8, 27)),
  ];

  // Jour sélectionné
  Day selectedDay = Day(name: 'Mar', date: DateTime(2023, 8, 22));

  // Rappel sélectionné
  int selectedReminder = 25;

  // Symptômes saisis
  String symptoms = '';

  // Méthode pour générer des créneaux horaires aléatoires
  void generateTimeSlots() {
    timeSlots.clear();
    Random random = Random();
    int startTime = random.nextInt(8) + 8; // Entre 8h et 16h
    int endTime = random.nextInt(4) + startTime + 1; // Entre startTime +1 et startTime +4
    for (int i = startTime; i < endTime; i++) {
      timeSlots.add(TimeSlot(
        from: TimeOfDay(hour: i, minute: random.nextBool() ? 0 : 30),
        to: TimeOfDay(hour: i + 1, minute: random.nextBool() ? 0 : 30),
      ));
    }
    setState(() {});
  }

// Méthode pour changer le jour sélectionné
void changeSelectedDay(Day day) {
setState(() {
selectedDay = day;
generateTimeSlots();
});
}

// Méthode pour changer le rappel sélectionné
void changeSelectedReminder(int reminder) {
setState(() {
selectedReminder = reminder;
});
}

// Méthode pour initialiser les données
@override
void initState() {
super.initState();
generateTimeSlots();
}

// Méthode pour construire l'interface de la page
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Prise de rendez-vous'),
leading: IconButton(
icon: Icon(Icons.menu),
onPressed: () {
// Ouvrir le menu
},
),
),
body: Column(
children: [
// Widget pour afficher les jours de la semaine
Container(
height: 80,
child: ListView(
scrollDirection: Axis.horizontal,
children: days
.map((day) => DayItem(
day: day,
onTap: changeSelectedDay,
isSelected: day == selectedDay))
.toList(),
),
),

// Widget pour afficher les créneaux horaires disponibles
Expanded(
child: ListView(
children: timeSlots
.map((timeSlot) => TimeSlotItem(timeSlot: timeSlot))
.toList(),
),
),

// Widget pour afficher les options de rappel
Container(
height: 80,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
ReminderItem(
reminder: 25,
onTap: changeSelectedReminder,
isSelected: selectedReminder == 25),
ReminderItem(
reminder: 10,
onTap: changeSelectedReminder,
isSelected: selectedReminder == 10),
ReminderItem(
reminder: 5,
onTap: changeSelectedReminder,
isSelected: selectedReminder == 5),
],
),
),

// Widget pour saisir les symptômes et l'état du médicament
Container(
height: 120,
padding: EdgeInsets.all(16),
child: Column(
children: [
TextField(
decoration:
InputDecoration(labelText: 'Symptômes'),
onChanged: (value) {
setState(() {
symptoms = value;
});
},
),
Row(
children: [
Text('Médicament pris ?'),
Switch(
value: symptoms.isNotEmpty,
onChanged:
symptoms.isEmpty ? null : (value) {},
),
],
),
],
),
),
],
),
);
}
}

// Widget personnalisé pour représenter un créneau horaire
class TimeSlotItem extends StatelessWidget {
const TimeSlotItem({Key? key, required this.timeSlot}) : super(key: key);

final TimeSlot timeSlot;

@override
Widget build(BuildContext context) {
return Card(
margin: EdgeInsets.all(8),
child: ListTile(
leading:
Icon(Icons.access_time, color: Colors.green, size: 40),
title:
Text(timeSlot.toString(), style: TextStyle(fontSize: 20)),
trailing:
Icon(Icons.arrow_forward, color: Colors.green, size: 30),
onTap: () {
// Prendre le rendez-vous
},
),
);
}
}

// Widget personnalisé pour représenter un jour de la semaine
class DayItem extends StatelessWidget {
const DayItem({Key? key, required this.day, required this.onTap, required this.isSelected}) : super(key: key);

final Day day;
final Function onTap;
final bool isSelected;

@override
Widget build(BuildContext context) {
return InkWell(
onTap: () => onTap(day),
child: Container(
width: 60,
margin: EdgeInsets.all(8),
padding: EdgeInsets.all(8),
decoration:
BoxDecoration(color:
isSelected ? Colors.green : Colors.white,
borderRadius:
BorderRadius.circular(10),
boxShadow:
[
BoxShadow(color:
Colors.grey.withOpacity(0.3), spreadRadius:
2, blurRadius:
5, offset:
Offset(0, 3)),
],
),
child:
Column(mainAxisAlignment:
MainAxisAlignment.center, children:
[
Text(day.name, style:
TextStyle(color:
isSelected ? Colors.white : Colors.black, fontWeight:
FontWeight.bold)),
Text(day.date.day.toString(), style:
TextStyle(color:
isSelected ? Colors.white : Colors.black, fontWeight:
FontWeight.bold)),
],
),
),
);
}
}

// Widget personnalisé pour représenter une option de rappel
class ReminderItem extends StatelessWidget {
const ReminderItem({Key? key, required this.reminder, required this.onTap, required this.isSelected}) : super(key: key);

final int reminder;
final Function onTap;
final bool isSelected;

@override
Widget build(BuildContext context) {
return InkWell(
onTap: () => onTap(reminder),
child:
Container(width:
60, height:
60, margin:
EdgeInsets.all(8), padding:
EdgeInsets.all(8), decoration:
BoxDecoration(color:
isSelected ? Colors.green : Colors.white, shape:
BoxShape.circle, boxShadow:
[
BoxShadow(color:
Colors.grey.withOpacity(0.3), spreadRadius:
2, blurRadius:
5, offset:
Offset(0, 3)),
],
), child:
Center(child:
Text('$reminder min', style:
TextStyle(color:
isSelected ? Colors.white : Colors.black))),
),
);
}
}

import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Docteur kodjo',
  'Docteur komlan',
  'Docteur koffi',
  'Docteur amah',
];
const List<String> listVisiteTime = <String>[
  'Lundi 8h-15h',
  'Mercredi 8h-12h',
  'Jeudi 8h-15h',
  'Vendredi 8h-15h',
];

class PrendreRendezVous extends StatefulWidget {
  const PrendreRendezVous({super.key});

  @override
  State<PrendreRendezVous> createState() => _PrendreRendezVousState();
}

class _PrendreRendezVousState extends State<PrendreRendezVous> {
  DateTime dateAujourdhui = DateTime.now();
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Prise de rendez-vous'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Motif',
                // contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownMenu<String>(
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              initialSelection: list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownMenu<String>(
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              initialSelection: listVisiteTime.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  listVisiteTime.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Confirmer',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

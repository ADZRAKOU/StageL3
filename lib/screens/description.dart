import 'package:flutter/material.dart';
import 'package:masante228/models/specialite.dart';
import 'package:masante228/screens/authentificate/medecin_login.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/utils.dart';

import '../models/medecin.dart';
import '../service/medecin_services.dart';

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

// ignore: must_be_immutable
class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.specialisation});
  final Specialite specialisation;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final medecinService = MedecinServices();
  // List<dynamic> specialisations = [
  //   {
  //     'id': 1,
  //     'name': 'Ophtamologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.remove_red_eye,
  //     'color': Colors.blue,
  //   },
  //   {
  //     'id': 2,
  //     'name': 'Dermatologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.sick_rounded,
  //     'color': Colors.orange,
  //   },
  //   {
  //     'id': 3,
  //     'name': 'Cardiologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.heart_broken,
  //     'color': Colors.red,
  //   }
  // ];

  DateTime dateAujourdhui = DateTime.now();
  late Medecin? dropdownValue = null;
  String dropdownValue2 = "";
  List<Medecin> medecins = [];
  bool loading = false;

  final TextEditingController txtMotif = TextEditingController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    txtMotif.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Détails de la spécialisation'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: loading
          ? Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: const EdgeInsets.only(
                  top: 25, left: 10, right: 10, bottom: 25),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add_home_work,
                          color: randomColor(),
                          size: MediaQuery.of(context).size.width / 2,
                        ),
                        Text(
                          widget.specialisation.nom,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.specialisation.description,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 25, left: 10, right: 10),
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
                              TextField(
                                controller: txtMotif,
                                decoration: const InputDecoration(
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
                              DropdownMenu<Medecin>(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        25,
                                      ),
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.9,
                                initialSelection: null,
                                onSelected: (Medecin? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                dropdownMenuEntries: medecins
                                    .map<DropdownMenuEntry<Medecin>>(
                                        (Medecin value) {
                                  return DropdownMenuEntry<Medecin>(
                                      value: value,
                                      label: "${value.nom} ${value.prenom}");
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownMenu<String>(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
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
                                    dropdownValue2 = value!;
                                  });
                                },
                                dropdownMenuEntries: listVisiteTime
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Prendre rendez vous',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  fetchData() async {
    setState(() {
      loading = true;
    });
    try {
      final ms = await medecinService.getAll();
      medecins = ms
          .where((element) => element.specialite == widget.specialisation.id)
          .toList();
    } catch (e) {
      kSnackBar(context, "Erreur de la recupération des medecins");
    }
    setState(() {
      loading = false;
    });
  }
}

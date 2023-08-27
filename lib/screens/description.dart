import 'package:flutter/material.dart';
import 'package:masante228/models/model.dart';
import 'package:masante228/models/specialite.dart';
import 'package:masante228/screens/authentificate/medecin_login.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/service/rendez_vous_services.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:provider/provider.dart';

import '../models/medecin.dart';
import '../service/medecin_services.dart';

// ignore: must_be_immutable
class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.specialisation});
  final Specialite specialisation;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final medecinService = MedecinServices();
  final rendezVousService = RendezVousServices();
  late UserProvider userProvider;

  late DateTime? dateAujourdhui = null;
  late TimeOfDay? heure = null;
  late Medecin? dropdownValue = null;
  String dropdownValue2 = "";
  List<Medecin> medecins = [];
  bool loading = false;

  final TextEditingController txtMotif = TextEditingController();

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () => maDate(),
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.resolveWith(
                                              (states) => 10),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.grey),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.black87),
                                    ),
                                    child: Text((dateAujourdhui == null)
                                        ? "Choisir date"
                                        : dateAujourdhui
                                            .toString()
                                            .split(" ")
                                            .first),
                                  ),
                                  TextButton(
                                    onPressed: () => monHeure(),
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.resolveWith(
                                              (states) => 10),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.grey),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.black87),
                                    ),
                                    child: Text(
                                      (heure == null)
                                          ? "Choisir heure"
                                          : heure!.format(context),
                                    ),
                                  ),
                                ],
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
                                onPressed: onPostRendezVous,
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

  maDate() async {
    dateAujourdhui = await montrerDate(context);
    setState(() {
      dateAujourdhui = dateAujourdhui;
    });
  }

  monHeure() async {
    heure = await montrerHeure(context);
    setState(() {
      heure = heure;
    });
  }

  onPostRendezVous() async {
    if (txtMotif.text.trim().isEmpty) {
      kSnackBar(
        context,
        "Veuillez mettre le motif",
        color: Colors.red,
      );
      return;
    }
    if (dropdownValue == null) {
      kSnackBar(
        context,
        "Veuillez mettre le medecin",
        color: Colors.red,
      );
      return;
    }
    if (dateAujourdhui == null || heure == null) {
      kSnackBar(
        context,
        "Veuillez une bonne date et heure",
        color: Colors.red,
      );
      return;
    }
    final _rendVous = RendezVous(
      motif: txtMotif.text,
      status: "en cours",
      dateHeure: dateAujourdhui?.add(
        Duration(
          hours: heure!.hour,
          minutes: heure!.minute,
        ),
      ),
      medecin: dropdownValue?.id,
      patient: userProvider.user?.id,
    );
    try {
      kSnackBar(
        context,
        "Enregistrement en cours...",
        color: Colors.orange,
      );
      await rendezVousService.save(_rendVous);
      // ignore: use_build_context_synchronously
      kSnackBar(context, "Enregistrement réussi !");
    } catch (e) {
      print(e);
      kSnackBar(
        context,
        "Erreur de l'engistrement du rendez-vous",
        color: Colors.red,
      );
    }
  }
}

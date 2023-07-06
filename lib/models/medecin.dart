import 'package:flutter/material.dart';

class Medecin {
  final int idMedecin;
  final String firstName;
  final String lastName;
  final String specialite;

  Medecin({
    required this.firstName,
    required this.idMedecin,
    required this.lastName,
    required this.specialite,
  });
}

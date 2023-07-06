import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Patient {
  final ObjectId idPatient;
  final String codePatient;
  final String nom;
  final String prenom;
  final String statut;
  final String sexe;
  final int age;
  final int numTel;
  final int numPersonne;
  final String typeAssurance;
  final String localisation;

  Patient({
    required this.nom,
    required this.prenom,
    required this.statut,
    required this.age,
    required this.numTel,
    required this.numPersonne,
    required this.typeAssurance,
    required this.idPatient,
    required this.codePatient,
    required this.localisation,
    required this.sexe,


  });
}

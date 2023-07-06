// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    required this.nom,
    required this.prenom,
    required this.codePatient,
    required this.sexe,
    required this.age,
    required this.numTel,
    required this.localisation,
    required this.numPersonne,
    required this.typeAssurance,
    required this.statut,
    required this.createdBy,
  });

  String nom;
  String codePatient;
  String prenom;
  Char sexe;
  String age;
  String numTel;
  String localisation;
  Int numPersonne;
  String typeAssurance;
  Int statut;
  Int createdBy;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        nom: json["nom"],
        prenom: json["prenom"],
        sexe: json["sexe"],
        age: json["age"],
        numTel: json["numTel"],
        localisation: json["localisation"],
        statut: json["statut"],
        codePatient: json["codePatient"],
        typeAssurance: json["typeAssurance"],
        numPersonne: json["numPersonne"],
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        
        "nom": nom,
        "prenom": prenom,
        "sexe": sexe,
        "age": age,
        "numTel": numTel,
        "localisation": localisation,
        "statut": statut,
        "codePatient": codePatient,
        "typeAssurance": typeAssurance,
        "numPersonne": numPersonne,
        "createdBy": createdBy,
      };
}

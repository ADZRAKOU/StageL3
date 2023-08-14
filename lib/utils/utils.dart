import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';

List<Map<String, dynamic>> speciality = [
  {
    "image": "eye.png",
    "specialite": "Ophtamologue",
    "color": Colors.deepPurpleAccent
  },
  {"image": "cardio.png", "specialite": "Cardiologue", "color": kPrimaryColor},
  {
    "image": "brain.png",
    "specialite": "Psychiatre",
    "color": Colors.deepOrangeAccent
  },
  {
    "image": "skin.png",
    "specialite": "Dermatologue",
    "color": Colors.lightBlue
  },
  {"image": "teeth.png", "specialite": "Dentiste", "color": Colors.teal}
];

enum RdvStatus { loading, finish, rejected }

List<Map<String, dynamic>> localRdvData = [
  {
    "name": "Dr ADZRAkou Sergine",
    "specialite": "Dentiste",
    "status": RdvStatus.loading
  },
  {
    "name": "Dr AKPA Akpro",
    "specialite": "Gynecologue",
    "status": RdvStatus.rejected
  },
  {
    "name": "Dr YEMDOUBALI Ahmed",
    "specialite": "Dermatologue",
    "status": RdvStatus.finish
  }
];

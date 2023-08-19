import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';

import '../widgets/text_widget.dart';

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

enum Status { initial, loading, loaded, error }

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
  },
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

Uri kProdUri({required String endPoint}) =>
    Uri.parse("http://10.0.2.2:8000/api/$endPoint");
showLoaderDialog(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(
              color: kPrimaryColor,
              strokeWidth: 1,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: const TextWidget(
                data: "Veuillez patienter...",
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    },
  );
}

kSnackBar(context, String message, {Color? color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: color ?? Colors.green,
        behavior: SnackBarBehavior.floating,
        width: kSize(context).width * 0.90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );

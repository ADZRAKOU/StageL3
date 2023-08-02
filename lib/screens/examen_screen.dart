import 'dart:convert';

import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../models/examen.dart';

class ExamenScreen extends StatelessWidget {
  const ExamenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        decoration: kBoxDecoIndigo,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20.0,
              ),
              ExamenGridView(),
            ]),
          ),
        ),
      ),
    );
  }
}

class ExamenGridView extends StatefulWidget {
  const ExamenGridView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExamenGridViewState createState() => _ExamenGridViewState();
}

class _ExamenGridViewState extends State<ExamenGridView> {
  List<Examens> examen = [];

  void loadMedecin() async {
    try {
      http.Response response = await http.get(
          Uri.parse("http://localhost:8000/api/accounts/users/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Token ',
          });
      final data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        final examen = data[i];
        //print(user);
        if (examen['nom'] != 0) {
          examen.add(Examens(nom: '${examen['nom']}', description: '${examen['nom']}'));
        }
      }
      setState(() {});
      //print(data);
      //print(data.length);
      //print();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    loadMedecin();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../models/examen.dart';

class Consultation extends StatelessWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
       // decoration: kBoxDecoIndigo,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20.0,
              ),
              ConsultationGridView(),
            ]),
          ),
        ),
      ),
    );
  }
}

class ConsultationGridView extends StatefulWidget {
  const ConsultationGridView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CosultationGridViewState createState() => _CosultationGridViewState();
}

class _CosultationGridViewState extends State<ConsultationGridView> {
  List<Consultation> consultation = [];

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
        final consultation = data[i];
        //print(user);
        if (consultation['description'] != 0) {
          consultation.add(Consultation());
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

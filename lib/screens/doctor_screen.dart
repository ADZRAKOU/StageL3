import 'dart:convert';

import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../models/doctors.dart';
import 'about_doctor.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

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
              DoctorGridView(),
            ]),
          ),
        ),
      ),
    );
  }
}

class DoctorGridView extends StatefulWidget {
  const DoctorGridView({Key? key}) : super(key: key);

  @override
  _DoctorGridViewState createState() => _DoctorGridViewState();
}

class _DoctorGridViewState extends State<DoctorGridView> {
  List<Doctors> doctors = [
    /*Doctors(doctorName: 'Christian Frazier', doctorType: 'Heart Surgeon', doctorLocation: 'London', doctorExperience: 12, doctorPatients: 230, doctorAbout: 'Specializes in surgical procedures of the heart, lungs, esophagus, and other organs in the chest.', doctorImage: 'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80'),
  Doctors(doctorName: 'Kamilla Andrews', doctorType: 'Neurologists', doctorLocation: 'Bristol', doctorExperience: 7, doctorPatients: 180, doctorAbout: 'Specializes in the anatomy, functions, and organic disorders of nerves and the nervous system.', doctorImage: 'https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80'),
  Doctors(doctorName: 'Angela Yu', doctorType: 'Physiologist', doctorLocation: 'Manchester', doctorExperience: 4, doctorPatients: 130, doctorAbout: 'Specializes in the branch of biology that deals with the normal functions of living organisms and their parts.', doctorImage: 'https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Max Müller', doctorType: 'Immunologist', doctorLocation: 'London', doctorExperience: 18, doctorPatients: 530, doctorAbout: 'Specializes in health issues brought on by immune system problems', doctorImage: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80'),
  Doctors(doctorName: 'Andrea Bizzotto', doctorType: 'Dentist', doctorLocation: 'Bristol', doctorExperience: 6, doctorPatients: 90, doctorAbout: 'Specializes in teeth, gums, and the mouth. ', doctorImage: 'https://images.pexels.com/photos/4173239/pexels-photo-4173239.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Mayme Gomez', doctorType: 'Neurologist', doctorLocation: 'Manchester', doctorExperience: 12, doctorPatients: 250, doctorAbout: 'Specializes in the anatomy, functions, and organic disorders of nerves and the nervous system', doctorImage: 'https://images.pexels.com/photos/4989131/pexels-photo-4989131.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  Doctors(doctorName: 'Iva Carpenter', doctorType: 'Radiologist', doctorLocation: 'London', doctorExperience: 2, doctorPatients: 50, doctorAbout: 'Specializes in X-rays or other high-energy radiation, especially a doctor specializing in radiology', doctorImage: 'https://images.pexels.com/photos/4225880/pexels-photo-4225880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
    Doctors(
        doctorName: 'Martin Smith',
        doctorType: 'Psychiatrist',
        doctorLocation: 'London',
        doctorExperience: 12,
        doctorPatients: 550,
        doctorAbout:
            'Specializing in the diagnosis and treatment of mental illness',
        doctorImage:
            'https://images.pexels.com/photos/4586993/pexels-photo-4586993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),*/
  ];

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
        final user = data[i];
        //print(user);
        if (user['specialite'] != 0) {
          doctors.add(Doctors(
              doctorName: '${user['last_name']} ${user['last_name']}',
              doctorType: "Pediatre",
              doctorLocation: "$user['adresse']",
              doctorExperience: 12,
              doctorPatients: 550,
              doctorAbout:
                  'Specializing in the diagnosis and treatment of mental illness',
              doctorImage:
                  'https://images.pexels.com/photos/4586993/pexels-photo-4586993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'));
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

  void initState() {
    super.initState();
    loadMedecin();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.87,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
          doctors.length,
          (index) => Container(
            decoration: kBoxDecoWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedImage(
                  doctorImage: doctors[index].doctorImage,
                  height: 70.0,
                  width: 70.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      doctors[index].doctorName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      doctors[index].doctorType,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black38),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ReusableMaterialBtn(
                  text: 'Contact',
                  width: 0.25,
                  color: Colors.white,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutDoctor(),
                        settings: RouteSettings(arguments: doctors[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

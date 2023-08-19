import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/rdv_widget.dart';
import 'package:masante228/widgets/text_widget.dart';

class AllRdvScreen extends StatefulWidget {
  const AllRdvScreen({super.key});

  @override
  State<AllRdvScreen> createState() => _AllRdvScreenState();
}

class _AllRdvScreenState extends State<AllRdvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          data: "Rendez-vous",
          color: kWhiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...localRdvData.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: RdvWidget(
                      doctorName: e["name"],
                      specialite: e["specialite"],
                      status: e["status"],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

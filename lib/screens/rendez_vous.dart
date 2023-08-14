import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/text_widget.dart';

import '../../utils/utils.dart';
import '../../widgets/rdv_widget.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSize(context).height - 70,
      width: double.infinity,
      child: Column(
        children: [
          /* Container(
            height: kSize(context).height / 6,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Align(
                  alignment: Alignment.center,
                  child: TextWidget(data: "Tous les Rendez-vous", color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w500,))),
                  Align(alignment: Alignment.centerRight,
                  child: Icon(Icons.info, color: kWhiteColor,),)
              ],
            ),
          ), */
          AppBar(
            title: TextWidget(
              data: "Tous les Rendez-vous",
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.info,
                  color: kWhiteColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
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
          ))
        ],
      ),
    );
  }
}

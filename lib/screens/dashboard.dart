import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:masante228/screens/dashboard_pages/all_rdv.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/rdv_widget.dart';
import 'package:masante228/widgets/specialite_widget.dart';
import 'package:masante228/widgets/text_widget.dart';

import 'bin/dashboard_pages/all_rdv.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSize(context).height - 70,
      width: double.infinity,
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Column(
        children: [
          /* Container(
            height: kSize(context).height / 6,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          data: "DashBoard",
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.notifications,
                      color: kWhiteColor,
                    ))
              ],
            ),
          ), */
          AppBar(
            title: TextWidget(
              data: "DashBoard",
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.notifications,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Salut Mlle Sergine,",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kBlackColor)),
                    TextSpan(
                        text: " Heureux de vous revoir",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                            fontSize: 18))
                  ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: kSize(context).width / 1.5,
                            child: const InputWidget(
                              placeholder: "Rechercher quelque chose",
                              applyBorder: true,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 45,
                          width: double.infinity,
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: kWhiteColor,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  TextWidget(
                    data: "Specialites",
                    color: kBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...speciality.map((e) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SpecialityWidget(
                                    color: e["color"],
                                    imageName: e["image"],
                                    speciality: e["specialite"]),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        data: "Rendez-vous a venir",
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                slidableRoute(nextPage: const AllRdvScreen()));
                          },
                          child: TextWidget(
                            data: "voir tout",
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: PageView.builder(
                        itemCount: localRdvData.length,
                        controller: PageController(viewportFraction: .95),
                        itemBuilder: (context, index) {
                          return RdvWidget(
                            hasMargin: true,
                            doctorName: localRdvData[index]["name"],
                            specialite: localRdvData[index]["specialite"],
                            status: localRdvData[index]["status"],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        data: "Les rendez-vous d'aujourd'hui",
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                slidableRoute(nextPage: const AllRdvScreen()));
                          },
                          child: TextWidget(
                            data: "voir tout",
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: PageView.builder(
                        itemCount: localRdvData.length,
                        controller: PageController(viewportFraction: .95),
                        itemBuilder: (context, index) {
                          return RdvWidget(
                            hasMargin: true,
                            doctorName: localRdvData[index]["name"],
                            specialite: localRdvData[index]["specialite"],
                            status: localRdvData[index]["status"],
                          );
                        }),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

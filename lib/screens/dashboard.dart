import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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
      decoration: const BoxDecoration(color: Color.fromARGB(255, 65, 33, 243)),
      child: Column(
        children: [
          Container(
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
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Salut Mr ADZRA,",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kBlackColor)),
                    TextSpan(
                        text: " Heureux de vous revoir",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor)),
                  ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: kSize(context).width / 1.5,
                            child: InputWidget(
                              placeholder: "Rechercher quelque chose",
                              applyBorder: true,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kPrimaryColor),
                              child: Center(
                                child: Icon(Icons.search, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

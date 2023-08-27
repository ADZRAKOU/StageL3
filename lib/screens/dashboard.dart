import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/models/personne.dart';
import 'package:masante228/models/rendez_vous.dart';
import 'package:masante228/screens/provider/page_provider.dart';
import 'package:masante228/screens/provider/rendez_vous_provider.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/input_widget.dart';
import 'package:masante228/widgets/rdv_widget.dart';
import 'package:masante228/widgets/specialite_widget.dart';
import 'package:masante228/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late UserProvider userProvider;
  late PageProvider pageProvider;

  late RendezVousProvider rendezVousProvider;
  late Personne? personne = userProvider.user;
  Status userStatus = Status.initial;
  Status rendStatus = Status.initial;

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    userProvider.addListener(userListener);
    rendezVousProvider = context.read<RendezVousProvider>();
    pageProvider = context.read<PageProvider>();
    rendezVousProvider.addListener(rendezListener);

    Future.delayed(Duration.zero, () {
      userProvider.getSpecialites();
      rendezVousProvider.getAll();
    });

    super.initState();
  }

  @override
  void dispose() {
    userProvider.removeListener(userListener);
    // userProvider.dispose();
    rendezVousProvider.removeListener(rendezListener);
    // rendezVousProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSize(context).height - 70,
      width: double.infinity,
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Column(
        children: [
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
          const SizedBox(
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
                        text:
                            "Salut ${personne?.genre == Genre.feminin ? "Mlle/Mdm" : "M."} ${personne?.prenom ?? ""},",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kBlackColor),
                      ),
                      TextSpan(
                        text: " Heureux de vous revoir",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                            fontSize: 18),
                      )
                    ]),
                  ),
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
                        const SizedBox(
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
                          ),
                        ),
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
                    child: userStatus == Status.loaded
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: userProvider.specialites
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SpecialityWidget(
                                        color: randomColor(),
                                        imageName: "brain.png",
                                        speciality: e.nom,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        : const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 50,
                              ),
                              child: LinearProgressIndicator(),
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
                            pageProvider.setPageInArborescence(
                              pageToSet: Pages.rdv,
                            );
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
                    child: getRendezVous(
                      rendezVousProvider.rendezVouss
                          .where(
                            (element) => compareDate(
                              element.dateHeure,
                              DateTime.now(),
                              addDay: 1,
                            ),
                          )
                          .toList(),
                    ),
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
                          pageProvider.setPageInArborescence(
                            pageToSet: Pages.rdv,
                          );
                        },
                        child: TextWidget(
                          data: "voir tout",
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: getRendezVous(
                      rendezVousProvider.rendezVouss
                          .where(
                            (element) => compareDate(
                              element.dateHeure,
                              DateTime.now(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  userListener() {
    userStatus = userProvider.status;
    if (userStatus == Status.loaded || userStatus == Status.error) {
      setState(() {});
    }
  }

  rendezListener() {
    rendStatus = rendezVousProvider.status;
    if (rendStatus == Status.loaded || rendStatus == Status.error) {
      setState(() {});
    }
  }

  Widget getRendezVous(List<RendezVous> rends) {
    if (rendStatus == Status.loaded) {
      if (rends.isEmpty) {
        return const RdvWidget(
          hasMargin: true,
          doctorName: "Vide",
          specialite: "Vide",
          status: RdvStatus.finish,
          id: 0,
        );
      } else {
        return PageView.builder(
          itemCount: rendezVousProvider.rendezVouss.length,
          controller: PageController(viewportFraction: .95),
          itemBuilder: (context, index) {
            return RdvWidget(
              hasMargin: true,
              doctorName: rends[index].medecin.toString(),
              specialite: "Cardio",
              status: rdvs[rends[index].status]!,
              id: rends[index].id,
            );
          },
        );
      }
    } else {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: LinearProgressIndicator(),
        ),
      );
    }
  }

  bool compareDate(DateTime? source, DateTime b, {int addDay = 0}) {
    return (source?.year == b.year) &&
        (source?.month == b.month) &&
        ((source?.day ?? 0 + addDay) == b.day);
  }
}

import 'package:flutter/material.dart';
import 'package:masante228/utils/path_utils.dart';

import '../../utils/color_utils.dart';
import '../../utils/screens_utils.dart';
import '../../widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
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
                  child: TextWidget(data: "Profile", color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w500,))),
                  Align(alignment: Alignment.centerRight,
                  child: Icon(Icons.edit_note, color: kWhiteColor,),)
              ],
            ),
          ), */
          AppBar(
            title: TextWidget(
              data: "Profile",
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.edit_note,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage(kImagePath(imageName: "person.png"))),
          ),
          TextWidget(
            data: "ADZRA Sergine",
            color: kWhiteColor,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20,
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
                  TabBar(
                      controller: TabController(length: 3, vsync: this),
                      tabs: [
                        Tab(
                          text: "Personnel",
                        ),
                        Tab(
                          text: "Dossier Medical",
                        ),
                        Tab(
                          text: "QR Code",
                        )
                      ])
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

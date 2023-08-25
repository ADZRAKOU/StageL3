import 'package:flutter/material.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/color_utils.dart';
import '../../utils/screens_utils.dart';
import '../../widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late UserProvider userProvider;

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TabController(length: 1, vsync: this);
    return Container(
      height: kSize(context).height - 70,
      width: double.infinity,
      child: Column(
        children: [
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
            data: "${userProvider.user?.nom} ${userProvider.user?.prenom}",
            color: kWhiteColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                TabBar(controller: controller, tabs: const [
                  Tab(
                    text: "Personnel",
                  ),
                  // Tab(
                  //   text: "Dossier Medical",
                  // ),
                  // Tab(
                  //   text: "QR Code",
                  // )
                ]),
                Expanded(
                  child: TabBarView(controller: controller, children: [
                    ListView(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: TextWidget(
                            data: "Nom",
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: TextWidget(
                            data: userProvider.user?.nom ?? "",
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: TextWidget(
                            data: "Prenom",
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: TextWidget(
                            data: userProvider.user?.prenom ?? "",
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: TextWidget(
                            data: "Email",
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: TextWidget(
                            data: userProvider.user?.email ?? "",
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: TextWidget(
                            data: "Genre",
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: TextWidget(
                            data: userProvider.user?.genre.name ?? "",
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: TextWidget(
                            data: "contact",
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: TextWidget(
                            data: userProvider.user?.contact ?? "",
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // const TextWidget(data: "Dossier medical"),
                    // const TextWidget(data: "Qr code")
                  ]),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

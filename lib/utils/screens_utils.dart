import 'package:flutter/material.dart';
import 'package:masante228/screens/dashboard.dart';
import 'package:masante228/screens/forum.dart';
import 'package:masante228/screens/profile.dart';
import 'package:masante228/screens/rendez_vous.dart';

Size kSize(_) => MediaQuery.of(_).size;

enum Pages { dashboard, forum, rdv, profile }

Map<Pages, Widget> pagesToWidget = {
  Pages.dashboard: const DashBoard(),
  Pages.forum: const Forum(),
  Pages.rdv: const RendezVous(),
  Pages.profile: const Profile()
};

List<Map<String, dynamic>> bottonNavigationBarData = [
  {"icon": "home.png", "page": Pages.dashboard},
  {"icon": "messages.png", "page": Pages.forum},
  {"icon": "meeting.png", "page": Pages.rdv},
  {"icon": "person.png", "page": Pages.profile}
];

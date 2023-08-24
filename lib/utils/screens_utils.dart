import 'package:flutter/material.dart';
import 'package:masante228/screens/dashboard.dart';
import 'package:masante228/screens/forum.dart';
import 'package:masante228/screens/profile.dart';
import 'package:masante228/screens/rendez_vous_screen.dart';

Size kSize(_) => MediaQuery.of(_).size;

enum Pages { dashboard, forum, rdv, profile }

Map<Pages, Widget> pagesToWidget = {
  Pages.dashboard: const DashBoard(),
  Pages.forum: const MyHomePage(title: '',),
  Pages.rdv: const RendezVousScreen(),
  Pages.profile: const Profile()
};

List<Map<String, dynamic>> bottonNavigationBarData = [
  {"icon": "home.png", "page": Pages.dashboard},
  {"icon": "messages.png", "page": Pages.forum},
  {"icon": "meeting.png", "page": Pages.rdv},
  {"icon": "person.png", "page": Pages.profile}
];
Route slidableRoute({required Widget nextPage}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

import 'dart:math';

import 'package:flutter/material.dart';

Color kPrimaryColor = const Color.fromARGB(255, 69, 143, 248);
Color kSecondColor = const Color(0xff02b478);
Color kWhiteColor = Colors.white;
Color kBlackColor = Colors.black;
Color kGreyColor = Colors.grey;
Color kColor = const Color.fromARGB(255, 101, 135, 250);

List<Color> _colors = [kSecondColor, Colors.red, Colors.yellow];

Color randomColor() => _colors[Random().nextInt(_colors.length)];

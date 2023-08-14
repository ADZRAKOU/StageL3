import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/widgets/text_widget.dart';

class SpecialityWidget extends StatelessWidget {
  final Color color;
  final String imageName;
  final String speciality;
  const SpecialityWidget({super.key, required this.color, required this.imageName, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Column(
        children: [
          Image.asset(kImagePath(imageName: imageName), color: kWhiteColor, height: 30,),
          Expanded(child: Align(
            alignment: Alignment.center,
            child: TextWidget(data: speciality, color: kWhiteColor, fontSize: 12, align: TextAlign.center,)))
        ],
      ),
    );
  }
}

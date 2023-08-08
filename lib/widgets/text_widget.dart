import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final double? fontSize;
  final TextAlign? align;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? isOverFlow;
  const TextWidget(
      {super.key,
      required this.data,
      this.fontSize,
      this.align,
      this.color,
      this.fontWeight,
      this.isOverFlow});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: GoogleFonts.poppins(fontSize: fontSize ?? 18, fontWeight: fontWeight, color: color),
      overflow: isOverFlow == null || isOverFlow == false? null : TextOverflow.ellipsis,
    );
  }
}

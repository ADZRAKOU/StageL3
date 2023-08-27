import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante228/models/model.dart';
import 'package:masante228/service/rendez_vous_services.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:masante228/widgets/text_widget.dart';

class RdvWidget extends StatelessWidget {
  final bool? hasMargin;
  final String? doctorName;
  final String specialite;
  final RdvStatus status;
  final int? id;
  const RdvWidget({
    super.key,
    this.hasMargin,
    required this.doctorName,
    required this.specialite,
    required this.status,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          margin: hasMargin == null || hasMargin == false
              ? null
              : const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidget(
                          data: doctorName ?? "Unknown",
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: specialite,
                                  style: GoogleFonts.poppins(
                                      color: kGreyColor, fontSize: 15)),
                              TextSpan(
                                  text: ".",
                                  style: GoogleFonts.poppins(
                                      color: kGreyColor, fontSize: 20)),
                              TextSpan(
                                text: status == RdvStatus.loading
                                    ? " En cours"
                                    : status == RdvStatus.rejected
                                        ? "Rejetes"
                                        : "Completes",
                                style: GoogleFonts.poppins(
                                    color: status == RdvStatus.loading
                                        ? Colors.orange
                                        : status == RdvStatus.finish
                                            ? Colors.green
                                            : Colors.red,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: onCancel,
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  onCancel() async {
    try {
      await RendezVousServices().update(id!);
    } catch (e) {
      print(e);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  final bool? applyBorder;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const InputWidget({super.key, required this.placeholder, this.applyBorder, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: placeholder,
          enabledBorder: applyBorder == null || applyBorder == false
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
          border: applyBorder == null || applyBorder == false
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
          focusedBorder: applyBorder == null || applyBorder == false
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor))),
    );
  }
}

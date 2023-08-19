import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final void Function()? onPressed;
  final String child;
  final Color? childColor;
  final Color? buttonColor;
  const ButtonWidget( {super.key, this.width, this.onPressed, required this.child, this.childColor, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor?? kPrimaryColor)),
          onPressed: onPressed,
          child: TextWidget(
            data: child,
            color: childColor ?? kWhiteColor,
          )),
    );
  }
}

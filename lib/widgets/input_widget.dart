import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  const InputWidget({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: placeholder
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/text_widget.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSize(context).height - 70,
      width: double.infinity,
      child: Column(
        children: [
          AppBar(
            title: TextWidget(
              data: "Forum de chat global",
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.grey[200]),
          ))
        ],
      ),
    );
  }
}

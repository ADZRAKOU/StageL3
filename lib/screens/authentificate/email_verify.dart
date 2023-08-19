import 'package:flutter/material.dart';
import 'package:masante228/screens/authentificate/signup_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/color_utils.dart';
import '../../utils/path_utils.dart';
import '../../utils/screens_utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmailVerifyState createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: kSize(context).height / 3.2,
                child: Center(
                  child: Image.asset(
                    kImagePath(imageName: "logo.png"),
                  ),
                ),
              ),
              const TextWidget(
                data: "TAPEZ VOTRE CODE ",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                    //width: kSize(context).width / 2,
                    child: "Confirmer",
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpPage()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import 'sign_up_form.dart';

class SignInForm extends StatefulWidget {
  SignInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Entrez un Email valid!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Mot de passe"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration:const InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

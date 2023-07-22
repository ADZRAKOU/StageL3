import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
   SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String _userName, _email, _password, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Nom"),
          TextFormField(
            decoration: InputDecoration(hintText: "masanté"),
            validator: RequiredValidator(errorText: "Nom "),
            // Let's save our username
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keybord
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Contact"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "+22892485339"),
            validator: RequiredValidator(errorText: "Contact"),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Mot de passe "),

          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Confirmez le mot de passe"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "*****"),
            validator: (pass) => MatchValidator(errorText: "Password do not  match").validateMatch(pass!, _password),
          ),
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

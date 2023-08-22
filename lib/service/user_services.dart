import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masante228/utils/utils.dart';

class UserServices {
  Future<void> signInUser({required String email}) async {
    try {
      var response = await http.post(
          kProdUri(endPoint: 'accounts/user/sign-in/'),
          body: jsonEncode({'email': email}),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode != 200) {
        throw Exception("une erreur s'est produite");
      }
      //return jsonEncode(response.body)
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> signUpUser(
      {required String nom,
      required String prenom,
      required String email,
      required String genre,
      required String contact}) async {
    try {
      print(kProdUri(endPoint: 'accounts/patient/').toString());
      var response = await http.post(kProdUri(endPoint: 'accounts/patient/'),
          body: jsonEncode({
            'last_name': nom,
            'first_name': prenom,
            'email': email,
            'genre': genre,
            'contact': contact
          }),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 400) {
        print(response.body);
        throw Exception("Exists");

        // throw Exception("une erreur s'est produite");
      }
      //return jsonEncode(response.body)
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> Specialite(
      {required String nom, required String specialite}) async {
    try {
      var response =
          await http.post(kProdUri(endPoint: 'accounts/user/sign-in/'),
              body: jsonEncode({
                'nom': nom,
                'specialite': specialite,
              }),
              headers: {"Content-Type": "application/json"});

      //return jsonEncode(response.body)
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<bool> checking(String email, String otp) async {
    try {
      await http.post(kProdUri(endPoint: 'accounts/user/sign-in/verify/'),
          headers: {"Content-Type": "application/json"},
          body: {'email': email, 'otp': otp});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

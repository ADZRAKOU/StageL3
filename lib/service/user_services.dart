import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masante228/models/personne.dart';
import 'package:masante228/models/specialite.dart';
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
      print(kProdUri(endPoint: 'accounts/patients/').toString());
      var response = await http.post(kProdUri(endPoint: 'accounts/patients/'),
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

  Future<Personne?> getInfos(String email) async {
    try {
      var response = await http.get(
        kProdUri(endPoint: "accounts/patients/"),
        headers: {'accept': 'application/json'},
      );
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsons) {
        print(data);
        var u = Personne.fromJson(data);
        if (u.email == email) return u;
      }
      return null;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<Specialite>> getAllSpecialites() async {
    List<Specialite> specialites = [];
    try {
      final response = await http.get(
        kProdUri(endPoint: "core/specialites/"),
        headers: {'accept': 'application/json'},
      );
      final jsons = jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsons) {
        print(data);
        specialites.add(Specialite.fromJson(data));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return specialites;
  }

  Future<void> saveSpecialite(Specialite specialite) async {
    try {
      final response =
          await http.post(kProdUri(endPoint: 'core/specialites/'),
              body: jsonEncode(specialite.toJon()),
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
          // headers: {"Content-Type": "application/json"},
          body: {'email': email, 'otp': otp});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

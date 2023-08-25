import 'package:flutter/material.dart';
import 'package:masante228/models/specialite.dart';
import 'package:masante228/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpecialiteServices {
  Future<List<Specialite>> getAllSpecialites() async {
    List<Specialite> specialites = [];
    try {
      var response = await http.get(
        kProdUri(endPoint: "core/specialites/"),
        headers: {'accept': 'application/json'},
      );
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
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
}
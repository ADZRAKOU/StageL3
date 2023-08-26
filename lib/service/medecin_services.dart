import 'dart:convert';

import 'package:masante228/models/medecin.dart';
import 'package:http/http.dart' as http;
import 'package:masante228/utils/utils.dart';

class MedecinServices {
  Future<List<Medecin>> getAll() async {
    try {
      var response = await http.get(
        kProdUri(endPoint: "accounts/medecins/"),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        List<Medecin> medecins = [];
        var jsons = jsonDecode(utf8.decode(response.bodyBytes));
        for (var data in jsons) {
          medecins.add(Medecin.fromJson(data));
        }
        return medecins;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Medecin?> save(Medecin medecin) async {
    try {
      var response = await http.post(
        kProdUri(endPoint: ""),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(medecin.toJson()),
      );
      if (response.statusCode == 200) {
        return Medecin.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print("Erreur de post ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Medecin?> getOne(int id) async {
    try {
      var response = await http.get(
        kProdUri(endPoint: "accounts/medecins/$id/"),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Medecin.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print("Erreur de post ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

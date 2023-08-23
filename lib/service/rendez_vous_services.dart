import 'dart:convert';

import 'package:masante228/models/rendez_vous.dart';
import 'package:http/http.dart' as http;
import 'package:masante228/utils/utils.dart';

class RendezVousServices {
  Future<List<RendezVous>> getAll() async {
    try {
      var response = await http.get(
        kProdUri(endPoint: ""),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        List<RendezVous> rendezVous = [];
        var jsons = jsonDecode(utf8.decode(response.bodyBytes));
        for (var data in jsons) {
          rendezVous.add(RendezVous.fromJson(data));
        }
        return rendezVous;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<RendezVous?> save(RendezVous rendezVous) async {
    try {
      var response = await http.post(
        kProdUri(endPoint: ""),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(rendezVous.toJson()),
      );
      if (response.statusCode == 200) {
        return RendezVous.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print("Erreur de post ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:masante228/models/rendez_vous.dart';
import 'package:http/http.dart' as http;
import 'package:masante228/utils/utils.dart';

class RendezVousServices {
  Future<List<RendezVous>> getAll() async {
    try {
      var response = await http.get(
        kProdUri(endPoint: "core/rendez-vous/"),
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
    print(rendezVous.toJson());
    try {
      var response = await http.post(
        kProdUri(endPoint: "core/rendez-vous/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(rendezVous.toJson()),
      );
      if (response.statusCode == 200) {
        return RendezVous.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print("Erreur de post ${response.statusCode} ${response.body}");
        return null;
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<RendezVous?> getOne(int id) async {
    try {
      var response = await http.get(
        kProdUri(endPoint: "core/rendez-vous/$id"),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return RendezVous.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<RendezVous?> update(int id) async {
    try {
      var request = await getOne(id);
      var json = request!.toJson();
      json["status"] = "annuler";
      var response = await http.put(
        kProdUri(endPoint: "core/rendez-vous/$id"),
        headers: {'Content-Type': 'application/json'},
        body: json,
      );
      if (response.statusCode == 200) {
        return RendezVous.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print("Erreur de post ${response.statusCode} ${response.body}");
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

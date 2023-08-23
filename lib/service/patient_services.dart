import 'dart:convert';

import 'package:masante228/utils/utils.dart';

import '../models/patient.dart';
import 'package:http/http.dart' as http;

class PatientServices {
  Future<Patient?> getInfos(String email) async {
    try {
      var response = await http.get(
        kProdUri(endPoint: ""),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var jsons = jsonDecode(utf8.decode(response.bodyBytes));
        for (var data in jsons) {
          var p = Patient.fromJson(data);
          if (p.email == email) return p;
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
